namespace :bme280 do
  task :get_weather => :environment do  	
    
    bme280 = Bme280Provider.new
    response = bme280.get_weather   
    next if response[:status] != 'OK'


    WeatherMeasure.create!(response[:data])

    mqtt = MqttBme280.new(DEVISES_CONF['mqtt'], DEVISES_CONF['bases'][0], DEVISES_CONF['bases'][0]['devises'][0])
    mqtt.publish(response[:data])
  end
end  