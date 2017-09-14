module Importer
  class ReferralParser < Parser

    def sort_data(index, identifier, row_data)
      participant = find_or_initialize_participant(row_data, identifier)
      data        = { demographic: extract_demographics(row_data), questionnaire: humanize_headers(row_data), participant: participant }

      @content.duplicate_row[index]     = data and return if @content.duplicate_rows?(identifier)
      @content.overwrite_warning[index] = data and return if participant.demographic.present?


      if participant.valid?
        @content.existing_participants[index] = data and return unless (identifier.blank? || participant.new_record?)
        @content.missing_entity_id[index]     = data and return if identifier.blank?
        @content.new_participants[index]      = data
      else
        @content.invalid_participants[index]  = data.merge(errors: participant.errors.full_messages.join(', '))
      end
    end

    private

    def find_or_initialize_participant(row, identifier)
      identity = { first_name: row.delete('Forename'), last_name: row.delete('Surname') }

      if row.has_key?('DateOfBirth')
        #Delete date of birth from row data and remove any white spaces within it to prevent unexpected output from DateTime.parse
        date_of_birth = row.delete('DateOfBirth').gsub(/\s+/, '')
        identity.merge!({ dob: DateTime.parse(date_of_birth) })
      end

      participant            = Participant.find_or_initialize_by(identity)
      participant.identifier = identifier
      participant
    end

    #If a second row exists, and is the more human readable (i.e. no unnecessary numbers or underscores), use that for the stored data keys instead (e.g. for Referral spreadsheet)
    def humanize_headers(row)
      return row unless @secondary_header.present?
      @header_mapping = Hash[@header.zip(@secondary_header)]

      Hash[row.map { |key, value| [key.match(/[1-9_]+/) ? @header_mapping[key] : key, value] }]
    end

    #Separate demographics data from other referral data in row
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
