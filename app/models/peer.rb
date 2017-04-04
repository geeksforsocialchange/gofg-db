class Peer < ApplicationRecord
  belongs_to :participant
  belongs_to :mentor
end
