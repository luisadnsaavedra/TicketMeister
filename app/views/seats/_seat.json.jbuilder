json.extract! seat, :id, :concert_id, :row, :number, :price, :created_at, :updated_at
json.url seat_url(seat, format: :json)
