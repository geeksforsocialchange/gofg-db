class Person < ApplicationRecord

  has_many :attendances
  has_many :events, through: :attendances

  validates_presence_of :first_name, :last_name, :type

  default_scope { order(last_name: :asc, first_name: :asc) }

  def to_s
    last_name + ", " + first_name
  end

  def self.types
    subclasses.map(&:to_s)
  end
end
