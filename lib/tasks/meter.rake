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
  	next unless [HeatingCord::HEATIN_CORD_AUTOMATIC_1H_SWITCH_MODE, HeatingCord::HEATIN_CORD_AUTOMATIC_1H_PER_DAY_MODE].include? HeatingCord.first.mode   
  	
    gateway = Eth485Gateway.new(ENV['ETH485_GATEWAY_IP'], ENV['ETH485_GATEWAY_PORT'].to_i)
    meter = Mercury.new(gateway, ENV['METER_ADDRESS'].to_i)
        
    begin
      sleep 1
      response = meter.get_UIP
      #puts response
    end while response[:status] != 'OK'
    
    if HeatingCord.first.mode == HeatingCord::HEATIN_CORD_AUTOMATIC_1H_SWITCH_MODE
      if response[:data][:amperage] > 0.1
        meter.disable_consumer
      else
        meter.enable_consumer
      end
    end

    if HeatingCord.first.mode == HeatingCord::HeatingCord::HEATIN_CORD_AUTOMATIC_1H_PER_DAY_MODE
      if Time.now.hour == 13
        meter.enable_consumer
      end  
      if Time.now.hour == 14
        meter.disable_consumer
      end
    end
  end
end
