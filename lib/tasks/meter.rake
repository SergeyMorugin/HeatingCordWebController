namespace :meter do
  task :get_moment_measure => :environment do  	
    #gateway = Eth485Gateway.new(ENV['ETH485_GATEWAY_IP'], ENV['ETH485_GATEWAY_PORT'].to_i)
    heating_cord = HeatingCord.first
    return if !heating_cord.enable
    
    gateway = SerialportGateway.new(ENV['SERIAL_PORT'])
    meter = Mercury.new(gateway, ENV['METER_ADDRESS'].to_i)
    response = meter.test_connection     
    next if response[:status] != 'OK'    

    response = meter.get_UIP
    puts response
    next if response[:status] != 'OK'
    
    if response[:data][:amperage] > 0.1
      MeterMomentMeasure.create!(response[:data]) 
    end  
  end
end
