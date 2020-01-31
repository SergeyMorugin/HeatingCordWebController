class ArduinoWeatherProvider

  def initialize (io_dev, address = 0)
    @io_dev = io_dev
    @address = address
  end

  def get_wheather
    response = @io_dev.get_data
    return response if response[:status] != 'OK'
    begin
      response_data = response[:body].delete('[').split(']').first.split('|')
      temperature = response_data[0].to_f
      pressure = response_data[1].to_f 
      humidity = response_data[2].to_f
      rainfall = response_data[3].to_i
      {status: 'OK', data: {temperature: temperature, pressure: pressure, humidity: humidity, rainfall: rainfall}}
    rescue => e
      return {status: 'Error', error_message: 'Unknown format', body: response['body']}
    end  
  end

private
  
  

end

=begin
  d = '/dev/ttyUSB1'
  sp = SerialportGateway.new(d)
  a = ArduinoWeatherProvider.new(sp)
  puts a.get_measure
	
=end