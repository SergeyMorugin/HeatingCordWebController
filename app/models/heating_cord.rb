class HeatingCord < ApplicationRecord
  validates :mode, presence: true
  HEATIN_CORD_OFF_MODE = 0
  HEATIN_CORD_MANUAL_ON_MODE = 1
  HEATIN_CORD_AUTOMATIC_1H_SWITCH_MODE = 10 #switching every hour to on or off
  HEATIN_CORD_AUTOMATIC_1H_PER_DAY_MODE = 20 #switching on just for 1 hour a day


  def update_mode(new_mode)  	
  	#return if new_mode == mode
  	#gateway = Eth485Gateway.new(ENV['ETH485_GATEWAY_IP'], ENV['ETH485_GATEWAY_PORT'].to_i)
    gateway = SerialportGateway.new(ENV['SERIAL_PORT'])
    meter = Mercury.new(gateway, ENV['METER_ADDRESS'].to_i)
    result = {}
  	case new_mode
  	  when HEATIN_CORD_OFF_MODE then
  	  	result = meter.disable_consumer
        if result['status'] = 'OK'
          self.update!(enable: false, mode: new_mode) 
        end  
  	  when HEATIN_CORD_MANUAL_ON_MODE then
        result = meter.enable_consumer
        if result['status'] = 'OK'
          self.update!(enable: true, mode: new_mode) 
        end  
  	  when HEATIN_CORD_AUTOMATIC_1H_SWITCH_MODE, HEATIN_CORD_AUTOMATIC_1H_PER_DAY_MODE then
        update!(mode: new_mode) 
  	    #puts meter.enable_consumer 
  	end
    
    result
  end

  def print_mode
  	case mode 
  	  when HEATIN_CORD_OFF_MODE then 'HEATIN_CORD_OFF_MODE'
  	  when HEATIN_CORD_MANUAL_ON_MODE then 'HEATIN_CORD_MANUAL_ON_MODE'
  	  when HEATIN_CORD_AUTOMATIC_1H_SWITCH_MODE then 'HEATIN_CORD_AUTOMATIC_1H_SWITCH_MODE'
      when HEATIN_CORD_AUTOMATIC_1H_PER_DAY_MODE then 'HEATIN_CORD_AUTOMATIC_1H_PER_DAY_MODE'
  	  else 'Undefinded'
  	end	

  end


end
