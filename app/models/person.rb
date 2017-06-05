class Person < ApplicationRecord

  has_many :attendances
  has_many :events, through: :attendances

  validates_presence_of :first_name, :last_name, :type

  scope :like, ->(filter) { where("first_name ILIKE :search OR last_name ILIKE :search OR email ILIKE :search", search: "%#{filter}%") }
  #default_scope { order(last_name: :asc, first_name: :asc) }

  def to_s
    last_name + ", " + first_name
  end

  def self.types
    subclasses.map(&:to_s)
  end
end
