module Importer
  class Parser

    def initialize(file)
      @file = file
      @content = Importer::Content.new
    end

    def parse
      file = File.read(@file.path)
      CSV.parse(file).each_with_index do |line, i|
        index = i + 1 #start at 1
        row = line.map { |l| l.strip if l.present? }

        #Set the first row as header is it contains the PersonID/EntityID.
        #Set a second header row if that exists too (usually in the Referral spreadsheets).
        #
        if row.first && row.first.match(/PersonID|EntityID/)
          if @header.blank?
            @header = row
          else
            @secondary_header = row
          end
          next
        end

        begin
          merged_row = Hash[@header.zip(row)] #Convert the row data into a hash with the header values as keys
          identifier = merged_row.shift.last #Entity ID/Person ID

          #sort_data - Implemented by the subclass
          sort_data(index, identifier, merged_row)
        rescue => e
          Rails.logger.debug e
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

  end
end
