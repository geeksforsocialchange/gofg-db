class ActivityCoach < ApplicationRecord
  belongs_to :event
  belongs_to :coach
  validates_presence_of :event, :coach
end
