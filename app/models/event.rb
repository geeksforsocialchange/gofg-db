class Event < ApplicationRecord
  has_many :attendances
  has_many :people, through: :addendances

  # Only for coaches right now but putting it here just in case
  has_many :activity_coaches
  has_many :coaches, through: :activity_coaches

  validates :other_attendee_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def duration
    event_end ? (event_end - event_start) / 60 / 60 : 0
  end

  def to_s
    name
  end
end
