json.extract! membership, :id, :person_id, :organisation_id, :member_start, :member_end, :notes, :created_at, :updated_at
json.url membership_url(membership, format: :json)
