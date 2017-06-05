class Upload < ApplicationRecord
  belongs_to :document

  enum :subtype, [:audio, :transcript, :photo, :file]

  has_attached_file :attachment, styles: { medium: '400x400>', thumb: '100x100>'}

  before_post_process :skip_for_audio

  validates_attachment_presence :attachment

  validates_attachment_file_name :attachment, matches: [/mp3\z/, /ogg\z/, /wav\z/, /wma\z/, /webm\z/], if: :audio?
  validates_attachment_content_type :attachment, content_type: /\Aimage/, if: :photo?

  def skip_for_audio
    #return false if audio file to stop post process
    !audio_content_types.any? { |format| attachment_content_type.match(format) }
  end

  def audio_content_types
    %w(mp3 ogg wav wma webm)
  end
end
