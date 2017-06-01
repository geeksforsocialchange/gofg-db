class Attendance < ApplicationRecord
  belongs_to :person
  belongs_to :event

  scope :by_event, ->(filter) { where(event_id: filter) }
end
