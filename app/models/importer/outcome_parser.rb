module Importer
  class OutcomeParser < Parser

    def sort_data
      participant  = Participant.find_by_identifier(identifier)

      if participant
        @content.matching_participants[index] = { questionnaire: row, participant: participant }
      else
        @content.missing_participants[index]  = { questionnaire: row }
      end
    end
  end
end
