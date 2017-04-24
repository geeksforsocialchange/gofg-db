class Event < ApplicationRecord
  has_many :attendances
  has_many :people, through: :addendances

  def duration
    event_end ? (event_end - event_start) / 60 / 60 : 0
  end

  def to_s
    name
  end
end
