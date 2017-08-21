module Importer
  class Content
    include Virtus.model

    #valid
    attribute :new_participant, Hash, default: {}      #referral
    attribute :existing_participant, Hash, default: {} #referral
    attribute :matching_participant, Hash, default: {} #outcome

    #warnings
    attribute :overwrite_warning, Hash, default: {}  #referral
    attribute :missing_entity_id, Hash, default: {}  #referral

    #errors
    attribute :duplicate_row, Hash, default: {} #referral
    attribute :invalid_participant, Hash, default: {}  #referral
    attribute :parsing_errors, Hash, default: {}  #referral
    attribute :missing_participant, Hash, default: {}  #outcome

    def total_valid
      existing_participant.length + matching_participant.length + new_participant.length
    end

    def total_warnings
      overwrite_warning.length + missing_entity_id.length
    end

    def total_errors
      duplicate_row.length + invalid_participant.length + parsing_errors.length + missing_participant.length
    end

    def total_valid_existing
      existing_participant.length + matching_participant.length
    end

    def duplicate_rows?(identifier)
      new_participant.has_key?(identifier) || existing_participant.has_key?(identifier)
    end

    def has_errors?
      !total_errors.zero?
    end

    def valid_referral
      [new_participant, existing_participant, overwrite_warning, missing_entity_id].inject(&:merge)
    end
  end
end
