module Importer
  class Parser

    def initialize(file, type)
      @file = file
      @type = type
      @content = Importer::Content.new
    end

    def parse
      file = File.read(@file.path)
      CSV.parse(file).each_with_index do |line, i|
        index= i + 1
        row = line.map { |l| l.strip if l.present? }

        if row.first && row.first.match(/PersonID|EntityID/)
          if @header.blank?
            @header = row
          else
            @secondary_header = row
          end
          next
        end

        begin
          merged_row = Hash[@header.zip(row)]
          entity_id = merged_row.shift.last

          self.send(@type, entity_id, merged_row, index)
        rescue => e
          Rails.logger.debug e.message

          @content.parsing_errors[index] = { errors: display_error(e.message) }
        end
      end

      @content
    end

    private

    def display_error(error)
      return "Invalid Date of Birth." if error == 'invalid date'

      I18n.t('imports.edit.parsing_errors')
    end

    def find_or_initialize_participant(row, identifier)
      last_name     = row.delete('Surname')
      first_name    = row.delete('Forename')
      date_of_birth = row.delete('DateOfBirth')

      if date_of_birth.present?
        date_of_birth = DateTime.parse(date_of_birth.gsub(/\s+/, ''))
        participant   = Participant.find_by(first_name: first_name, last_name: last_name, dob: date_of_birth)
      end

      if participant.blank?
        participant     = Participant.find_or_initialize_by(first_name: first_name, last_name: last_name)
        participant.dob = date_of_birth
      end

      participant.identifier = identifier
      participant
    end

    def outcome(identifier, row, index)
      participant  = Participant.find_by_identifier(identifier)

      if participant
        @content.matching_participant[index] = { questionnaire: row, participant: participant }
      else
        @content.missing_participant[index] = { questionnaire: row }
      end
    end

    def referral(identifier, row, index)
      participant   = find_or_initialize_participant(row, identifier)
      data          = { demographic: extract_demographics(row), questionnaire: humanize_questionnaire(row), participant: participant }

      @content.duplicate_row[index]  = data and return if @content.duplicate_rows?(identifier)
      @content.overwrite_warning[index] = data and return if participant.demographic.present?


      if participant.valid?
        @content.existing_participant[index] = data and return unless (identifier.blank? || participant.new_record?)
        @content.missing_entity_id[index] = data and return if identifier.blank?
        @content.new_participant[index] = data
      else
        @content.invalid_participant[index] = data.merge(errors: participant.errors.full_messages.join(', '))
      end
    end

    def humanize_questionnaire(row)
      return row unless @secondary_header.present?
      @header_mapping = Hash[@header.zip(@secondary_header)]

      Hash[row.map { |key, value| [key.match(/[1-9_]+/) ? @header_mapping[key] : key, value] }]
    end

    def extract_demographics(row)
      demographics_headers = I18n.t('imports.headers').stringify_keys

      demographics = {}

      demographics_headers.each do |header, field|
        demographics[field] = row.delete(header)
      end

      demographics
    end
  end



end
