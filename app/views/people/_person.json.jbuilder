json.extract! person, :id, :first_name, :last_name, :nicknames, :tel, :email, :twitter, :is_accreditor, :dob, :notes, :created_at, :updated_at
json.url person_url(person, format: :json)
