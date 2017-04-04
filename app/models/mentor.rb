class Mentor < Person
  has_many :peers
  has_many :participants, through: :peers
end
