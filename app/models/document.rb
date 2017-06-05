class Document < ApplicationRecord

  has_and_belongs_to_many :people
  has_and_belongs_to_many :events
  has_many :uploads

  scope :like, ->(filter) { joins(:uploads).where("name ILIKE :search OR
                                                  description ILIKE :search OR
                                                  researcher ILIKE :search OR
                                                  uploads.attachment_file_name ILIKE :search",
                                                  search: "%#{filter}%") }

end
