namespace :meter do
  task :get_moment_measure => :environment do  	
    gateway = Eth485Gateway.new(ENV['ETH485_GATEWAY_IP'], ENV['ETH485_GATEWAY_PORT'].to_i)
    meter = Mercury.new(gateway, ENV['METER_ADDRESS'].to_i)
    response = meter.test_connection     
    next if response[:status] != 'OK'    

    response = meter.get_UIP
    puts response
    next if response[:status] != 'OK'
    
    
    MeterMomentMeasure.create!(response[:data]) 
  end
end
