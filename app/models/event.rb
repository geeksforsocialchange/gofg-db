class Event < ApplicationRecord
  has_many :attendances
  has_many :people, through: :attendances

  # Only for coaches right now but putting it here just in case
  has_many :activity_coaches
  has_many :coaches, through: :activity_coaches

  validates :type, presence: true

  scope :like, ->(filter) { where("name ILIKE :search OR location ILIKE :search", search: "%#{filter}%") }

  def self.types
    ['Activity', 'Fieldwork', 'Meeting']
  end

  def duration
    event_end ? ((event_end - event_start) / 60 / 60).round(1) : 0
  end

  def to_s
    name
  end
end
