namespace :meter do
  task :get_moment_measure => :environment do  	
    gateway = Eth485Gateway.new(ENV['ETH485_GATEWAY_IP'], ENV['ETH485_GATEWAY_PORT'].to_i)
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

  task :switch_every_hour => :environment do 
  	next if HeatingCord.first.mode != HeatingCord::HEATIN_CORD_AUTOMATIC_1H_SWITCH_MODE   
  	gateway = Eth485Gateway.new(ENV['ETH485_GATEWAY_IP'], ENV['ETH485_GATEWAY_PORT'].to_i)
    meter = Mercury.new(gateway, ENV['METER_ADDRESS'].to_i)
        
    begin
      sleep 1
      response = meter.get_UIP
      #puts response
    end while response[:status] != 'OK'
    
    if response[:data][:amperage] > 0.1
      meter.disable_consumer
    else
      meter.enable_consumer
    end 

  end
end
