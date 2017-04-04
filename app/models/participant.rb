class Participant < Person
  has_many :peers
  has_many :mentors, through: :peers
end
