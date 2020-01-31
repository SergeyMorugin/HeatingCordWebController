require 'serialport'

class SerialportGateway

  def initialize (serial_port)  	
  	@serial_port = serial_port 	
  end

  def get_data(request = '') 	
    begin
      result = {status: 'Unknown'}
      SerialPort.open(@serial_port, 9600, 8, 1, SerialPort::NONE) do |serial_port |
        serial_port.flush_input

        response = serial_port.readline("\r\n")
        puts "IN #{response}"
      
        result = {status: 'OK', body: response} 
      end
      result  
    rescue => e
      {status: 'Error', error_message: e.to_s}
    end
  end

end