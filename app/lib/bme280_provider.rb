class Bme280Provider

  def initialize (address = 1)
    @address = address
  end

  def get_weather
    begin
      bme280 = I2C::Driver::BME280.new(device: @address)
      values = bme280.all
      temperature = values[:t]
      pressure = values[:p] 
      humidity = values[:h]
      rainfall = 0
      {status: 'OK', data: {temperature: temperature, pressure: pressure, humidity: humidity, rainfall: rainfall}}
    rescue => e
      return {status: 'Error', error_message: e.message, body: ''}
    end  
  end
end