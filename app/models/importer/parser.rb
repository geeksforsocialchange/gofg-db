module Importer
  class Parser

    def initialize(file)
      @file = file
      @content = Importer::Content.new
    end

    def parse
      file  = File.read(@file.path)
      @data = CSV.parse(file)

      #Set the first row as header is it contains the PersonID/EntityID.
      #Set a second header row if that exists too.
      @header           = extract_column_header
      @secondary_header = extract_column_header

      @data.each_with_index do |line, i|
        index = i + 1 #start at 1
        row = line.map { |l| l.strip if l.present? }

        begin
          merged_row = Hash[@header.zip(row)] #Convert the row data into a hash with the header values as keys
          identifier = merged_row.select { |key, value| key.match(/PersonID|EntityID/) }.values.first #Get Entity ID/Person ID. There is probably a more efficient way to do this. But right now trying to directly grab the key can failing due to invisible characters.

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

    def extract_column_header
      return unless @data.first.any? { |header| header.present? &&  header.match(/PersonID|EntityID/) }

      @data.slice!(0).map { |l| l.strip if l.present? }
    end

    def display_error(error)
      return "Invalid Date of Birth." if error == 'invalid date'

      I18n.t('imports.edit.parsing_errors')
    end

  end
end
