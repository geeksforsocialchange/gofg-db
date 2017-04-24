class Activity < Event
  has_many :activity_coaches
  has_many :coaches, through: :activity_coaches
end
