class Membership < ApplicationRecord
  belongs_to :person
  belongs_to :organisation
  validates_presence_of :person, :organisation

  scope :by_organisation, ->(filter) { where(organisation_id: filter) }
end
