class ActivityCoach < ApplicationRecord
  belongs_to :event
  belongs_to :coach, foreign_key: :person_id
  validates_presence_of :event, :coach
end
