json.extract! place, :id, :trip_id, :address, :name, :description, :image_url, :start_time, :end_time, :created_at, :updated_at
json.url place_url(place, format: :json)
