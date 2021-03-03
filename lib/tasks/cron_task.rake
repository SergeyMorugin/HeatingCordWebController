namespace :cron_task do
  task :every_minute => :environment do
    # Read BME280
    bme280 = Bme280Provider.new
    response = bme280.get_weather
    next if response[:status] != 'OK'

    WeatherMeasure.create!(response[:data])

    mqtt = MqttBme280.new(DEVISES_CONF['mqtt'], DEVISES_CONF['bases'][0], DEVISES_CONF['bases'][0]['devises'][0])
    mqtt.publish(response[:data])


    # Read mercury 200
    heating_cord = HeatingCord.first
    next if !heating_cord.enable

    gateway = SerialportGateway.new(ENV['SERIAL_PORT'])
    meter = Mercury.new(gateway, ENV['METER_ADDRESS'].to_i)
    response = meter.test_connection
    next if response[:status] != 'OK'

    response = meter.get_UIP
    puts response
    next if response[:status] != 'OK'

    if response[:data][:amperage] > 0.1
      MeterMomentMeasure.create!(response[:data])

      m = MqttMercury.new(DEVISES_CONF['mqtt'], DEVISES_CONF['bases'][0], DEVISES_CONF['bases'][0]['devises'][1])
      m.publish(response[:data])
    end
  end
end
