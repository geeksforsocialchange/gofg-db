class Participant < Person
  has_many :peers
  has_many :mentors, through: :peers
  has_many :memberships
  has_many :organisations, through: :memberships
end
