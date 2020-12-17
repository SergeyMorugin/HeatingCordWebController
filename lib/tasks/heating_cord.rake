namespace :heating_cord do
  task :every_hour_task => :environment do 
    next unless [HeatingCord::HEATIN_CORD_AUTOMATIC_1H_SWITCH_MODE, HeatingCord::HEATIN_CORD_AUTOMATIC_1H_PER_DAY_MODE].include? HeatingCord.first.mode   
    
    #gateway = Eth485Gateway.new(ENV['ETH485_GATEWAY_IP'], ENV['ETH485_GATEWAY_PORT'].to_i)
    gateway = SerialportGateway.new(ENV['SERIAL_PORT'])
    meter = Mercury.new(gateway, ENV['METER_ADDRESS'].to_i)
    heating_cord = HeatingCord.first
    #begin
      sleep 1
      response = meter.test_connection
      #puts response
    next if response[:status] != 'OK'
    
    if heating_cord.mode == HeatingCord::HEATIN_CORD_AUTOMATIC_1H_SWITCH_MODE
      if heating_cord.enable# response[:data][:amperage] > 0.1
        meter.disable_consumer
        heating_cord.update(enable: false)
      else
        meter.enable_consumer
        heating_cord.update(enable: true)
      end
    end

    if heating_cord.mode == HeatingCord::HEATIN_CORD_AUTOMATIC_1H_PER_DAY_MODE
      if Time.now.hour == 6
        meter.enable_consumer
        heating_cord.update(enable: true)
      end  
      if Time.now.hour == 17
        meter.disable_consumer
        heating_cord.update(enable: false)
      end
    end
  end
end  