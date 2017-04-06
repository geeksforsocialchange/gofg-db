class Membership < ApplicationRecord
  belongs_to :person
  belongs_to :organisation
  validates_presence_of :person, :organisation
end
