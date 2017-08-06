require 'csv'

class Import < ApplicationRecord

  self.inheritance_column = nil
  has_attached_file :file
  validates_attachment_file_name :file, matches: [/csv\z/]

  enum type: [ :referral, :outcome ]
  enum step: [ :review, :completed ]

  before_post_process :skip_post_process

  validates :type, inclusion: { in: self.types.keys }

  def skip_post_process
    false
  end

end
