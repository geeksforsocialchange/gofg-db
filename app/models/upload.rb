class Upload < ApplicationRecord
  belongs_to :document

  enum subtype: [:audio, :transcript, :photo, :file]

  has_attached_file :attachment, styles: { medium: '400x400>', thumb: '100x100>'}

  before_post_process :skip_for_non_photos

  validates_attachment_presence :attachment

  validates_attachment_file_name :attachment, matches: [/mp3\z/i, /ogg\z/i, /wav\z/i, /wma\z/i, /webm\z/i], if: :audio?
  validates_attachment_content_type :attachment, content_type: /\Aimage/, if: :photo?

  scope :by_subtype, ->(subtype) { where(subtype: subtype) }

  def skip_for_non_photos
    #return false if not photo to stop post process
    !!attachment_content_type.match(/\Aimage/)
  end

end
