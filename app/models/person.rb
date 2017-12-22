class Person < ApplicationRecord

  has_many :attendances
  has_many :events, through: :attendances

  has_one :demographic
  has_many :questionnaires

  validates_presence_of :first_name, :last_name, :type
  validates_uniqueness_of :identifier, allow_blank: true, message: "person/entity id %{value} has already been taken"

  scope :like, ->(filter) { where("first_name ILIKE :search OR last_name ILIKE :search OR email ILIKE :search", search: "%#{filter}%") }
  #default_scope { order(last_name: :asc, first_name: :asc) }

  def self.consent_types
    %w(not_yet_gained personal_only parental_and_personal)
  end

  def to_s
    "#{last_name}, #{first_name}"
  end

  def self.types
    subclasses.map(&:to_s)
  end

  def is_participant?
    type == 'Participant'
  end


end
