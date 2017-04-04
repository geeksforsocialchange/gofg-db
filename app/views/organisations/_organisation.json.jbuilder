json.extract! organisation, :id, :name, :activity, :email, :tel, :address_1, :address_2, :city, :postcode, :notes, :created_at, :updated_at
json.url organisation_url(organisation, format: :json)
