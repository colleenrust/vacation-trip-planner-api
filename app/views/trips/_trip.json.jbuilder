json.extract! trip, :id, :user_id, :title, :image_url, :start_time, :end_time, :created_at, :updated_at
json.url trip_url(trip, format: :json)
