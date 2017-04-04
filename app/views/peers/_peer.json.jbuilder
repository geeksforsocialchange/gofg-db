json.extract! peer, :id, :participant_id, :mentor_id, :peer_start, :peer_end, :notes, :created_at, :updated_at
json.url peer_url(peer, format: :json)
