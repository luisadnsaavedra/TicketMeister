json.extract! concert, :id, :title, :description, :created_at, :updated_at
json.url concert_url(concert, format: :json)
