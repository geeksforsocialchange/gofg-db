class Organisation < ApplicationRecord

  has_many :memberships
  has_many :people, through: :memberships

  scope :like, ->(filter) { where("name ILIKE :search OR email ILIKE :search", search: "%#{filter}%") }

  enum activity: {
    "Boxing": 0,
    "Football": 1,
    "Theatre": 2,
    "Dance": 3
  }

  def address
    "#{address_1}, #{address_2}, #{city}, #{postcode}"
  end

  def to_s
    name
  end
end
