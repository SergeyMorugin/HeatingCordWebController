namespace :arduino do
  task :get_weather => :environment do  	
    gateway = SerialportGateway.new(ENV['ANDUINO_SERIAL_PORT'])
    arduino = ArduinoWeatherProvider.new(gateway)
    response = arduino.get_measure    
    next if response[:status] != 'OK'     
    #WeatherMeasure.create!(response[:data])     
  end