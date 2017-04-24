class Coach < Person
  has_many :activity_coaches
  has_many :activities, through: :activity_coaches
end
