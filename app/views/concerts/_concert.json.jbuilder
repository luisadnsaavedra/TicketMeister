json.extract! concert, :id, :theater_id, :title, :created_at, :updated_at
json.url concert_url(concert, format: :json)
