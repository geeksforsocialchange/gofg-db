json.extract! event, :id, :name, :event_start, :event_end, :event_type, :location, :notes, :other_attendees, :type, :created_at, :updated_at
json.url event_url(event, format: :json)
