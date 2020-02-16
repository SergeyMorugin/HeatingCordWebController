class HeatingCord < ApplicationRecord
  HEATIN_CORD_OFF_MODE = 0
  HEATIN_CORD_MANUAL_ON_MODE = 1
  HEATIN_CORD_AUTOMATIC_MODE = 10

  def update_mode(new_mode)  	
  	return if new_mode == mode
  	gateway = Eth485Gateway.new(ENV['ETH485_GATEWAY_IP'], ENV['ETH485_GATEWAY_PORT'].to_i)
    meter = Mercury.new(gateway, ENV['METER_ADDRESS'].to_i)
    result = {}
  	case new_mode
  	  when HEATIN_CORD_OFF_MODE then
  	  	result = meter.disable_consumer
  	  when HEATIN_CORD_MANUAL_ON_MODE then
        result = meter.enable_consumer
  	  when HEATIN_CORD_AUTOMATIC_MODE then
  	    #puts meter.enable_consumer 
  	end
    update!(mode: new_mode)
    result
  end

  def print_mode
  	case mode 
  	  when HEATIN_CORD_OFF_MODE then 'HEATIN_CORD_OFF_MODE'
  	  when HEATIN_CORD_MANUAL_ON_MODE then 'HEATIN_CORD_MANUAL_ON_MODE'
  	  when HEATIN_CORD_AUTOMATIC_MODE then 'HEATIN_CORD_AUTOMATIC_MODE'
  	  else 'Undefinded'
  	end	

  end


end
