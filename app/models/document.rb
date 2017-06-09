class Document < ApplicationRecord

  has_and_belongs_to_many :people
  has_and_belongs_to_many :events
  has_many :uploads

  validates_presence_of :name, :type

  INTERVIEW = 'Interview'
  GALLERY = 'Gallery'
  OUTPUT = 'Output'

  scope :like, ->(filter) { joins(:uploads).where("name ILIKE :search OR
                                                  researcher ILIKE :search OR
                                                  uploads.attachment_file_name ILIKE :search",
                                                  search: "%#{filter}%") }

  def self.types
    [INTERVIEW, GALLERY, OUTPUT]
  end

  validates :type, inclusion: { in: self.types }

  def is_interview?
    type == INTERVIEW
  end

  def is_gallery?
    type == GALLERY
  end

  def is_output?
    type == OUTPUT
  end
end
