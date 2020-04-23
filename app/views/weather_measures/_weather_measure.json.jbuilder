json.extract! weather_measure, :id, :temperature, :pressure, :humidity, :rainfall, :created_at, :updated_at
json.url weather_measure_url(weather_measure, format: :json)
