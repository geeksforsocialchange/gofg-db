module Importer
  class Content
    include Virtus.model

    #valid
    attribute :new_participants, Hash, default: {}      #referral
    attribute :existing_participants, Hash, default: {} #referral
    attribute :matching_participants, Hash, default: {} #outcome

    #warnings
    attribute :overwrite_warning, Hash, default: {}  #referral
    attribute :missing_entity_id, Hash, default: {}  #referral

    #errors
    attribute :duplicate_row, Hash, default: {} #referral
    attribute :invalid_participants, Hash, default: {}  #referral
    attribute :parsing_errors, Hash, default: {}  #referral
    attribute :missing_participants, Hash, default: {}  #outcome

    def total_valid
      existing_participants.length + matching_participants.length + new_participants.length
    end

    def total_warnings
      overwrite_warning.length + missing_entity_id.length
    end

    def total_errors
      duplicate_row.length + invalid_participants.length + parsing_errors.length + missing_participants.length
    end

    def total_valid_existing
      existing_participants.length + matching_participants.length
    end

    def duplicate_rows?(identifier)
      new_participants.has_key?(identifier) || existing_participants.has_key?(identifier)
    end

    def has_errors?
      !total_errors.zero?
    end

    def valid_referral
      [new_participants, existing_participants, overwrite_warning, missing_entity_id].inject(&:merge)
    end
  end
end
