module Importer
  class Content
    include Virtus.model

    #valid
    attribute :new_participant, Hash, default: {}
    attribute :existing_participant, Hash, default: {}
    attribute :matching_participant, Hash, default: {}

    #warnings
    attribute :overwrite_warning, Hash, default: {}
    attribute :missing_entity_id, Hash, default: {}

    #errors
    attribute :duplicate_row, Hash, default: {}
    attribute :invalid_participant, Hash, default: {}
    attribute :parsing_errors, Hash, default: {}
    attribute :missing_participant, Hash, default: {}

    def total_valid
      existing_participant.length + matching_participant.length + new_participant.length
    end

    def total_warnings
      overwrite_warning.length + missing_entity_id.length
    end

    def total_errors
      duplicate_row.length + invalid_participant.length + parsing_errors.length + missing_participant.length
    end


  end
end
