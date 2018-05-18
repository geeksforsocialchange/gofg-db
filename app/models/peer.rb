class Peer < ApplicationRecord
  belongs_to :participant, foreign_key: :participant_id, class_name: 'Person'
  belongs_to :mentor

  validates :participant_id, :mentor_id, presence: true

  scope :by_mentor, ->(filter) { where(mentor_id: filter) }
end
