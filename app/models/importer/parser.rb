module Importer
  class Parser

    def initialize(file, type)
      @file = file
      @type = type
      @content = Importer::Content.new
    end

    def parse
      @header = @alt_header = nil

      CSV.foreach(@file.path).with_index(1) do |line, index|
        row = line.map { |l| l.try(:strip) }

        if ['PersonID', 'EntityID'].include?(row.first)
          puts row
          @header.blank? ? @header = row : @alt_header = row
          next
        end

        begin
          merged_row = Hash[@header.zip(row)]
          merged_row.merge!(Hash[@alt_header.zip(row)]) if @alt_header

          entity_id = merged_row.delete('PersonID') || merged_row.delete('EntityID')


          self.send(@type, entity_id, merged_row, index)
        rescue => e
          Rails.logger.debug e
          @content.parsing_errors[index] = e.message
        end
      end

      @content
    end

    private

    def find_or_initialize_participant(row, identifier)
      puts row
      date_of_birth = row.delete('DateOfBirth')
      first_name    = row.delete('Forename')
      last_name     = row.delete('Surname')

      if date_of_birth.present?
        date_of_birth = DateTime.parse(date_of_birth.gsub(/\s+/, ''))
        participant = Participant.find_by(first_name: first_name, last_name: last_name, dob: date_of_birth)
      end

      if participant.blank?
        participant = Participant.find_or_initialize_by(first_name: first_name, last_name: last_name)
        participant.dob = date_of_birth
      end

      participant.identifier = identifier
      participant
    end

    def outcome(identifier, row, index, participant)
      participant  = Participant.find_by_identifier(identifier)

      if participant
        @content.matching_participant[identifier] = { questionnaire: row, participant: participant }
      else
        @content.missing_participant[index] = { questionnaire: row }
      end
    end

    def referral(identifier, row, index)
      participant   = find_or_initialize_participant(row, identifier)
      data          = { demographic: extract_demographics(row), referral: row, participant: participant }

      if participant.demographic.present?
        @content.overwrite_warning[index] = data
      elsif identifier.blank?
        @content.missing_entity_id[index] = data
      elsif @content.new_participant.has_key?(identifier) || @content.existing_participant.has_key?(identifier)
        @content.duplicate_row[index]  = data
      elsif participant.new_record?
        if participant.valid?
          @content.new_participant[identifier] = data
        else
          @content.invalid_participant[index] = data.merge(errors: participant.errors.full_messages)
        end
      else
        @content.existing_participant[identifier] = data
      end
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
