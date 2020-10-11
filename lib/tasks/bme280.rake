namespace :bme280 do
  task :get_weather => :environment do  	
    
    bme280 = Bme280Provider.new
    response = bme280.get_weather   
    next if response[:status] != 'OK'     
    WeatherMeasure.create!(response[:data])     
  end
end  