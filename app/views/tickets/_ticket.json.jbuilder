json.extract! ticket, :id, :user_id, :seat_id, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
