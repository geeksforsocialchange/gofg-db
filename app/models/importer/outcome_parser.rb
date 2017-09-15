module Importer
  class OutcomeParser < Parser

    def sort_data(index, identifier, row_data)
      participant  = Participant.find_by_identifier(identifier)

      if participant
        @content.matching_participants[index] = { questionnaire: row_data, participant: participant }
      else
        @content.missing_participants[index]  = { questionnaire: row_data }
      end
    end
  end
end
