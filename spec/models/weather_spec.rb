require_relative '../../app/lib/arduino_weather_provider'

RSpec.describe ArduinoWeatherProvider do
  let(:provider){ ArduinoWeatherProvider.new(IOStub.new)}

	it 'returns a weather measure if format is correct' do
    serial_port = double
    allow(serial_port).to receive(:get_data).and_return({status: 'OK', body: '[0.58|741.91|66.04|133]'} )
    provider = ArduinoWeatherProvider.new(serial_port)
    response = {status: 'OK', data: {:humidity=>66.04, :pressure=>741.91, :rainfall=>133, :temperature=>0.58}}    
    expect(provider.get_weather).to eq(response)
	end
end

__END__
#require_relative '../eth485_gateway'

IOAnswer = Struct.new(:status, :data, :error_message)

class IOStub
  def get_data(data='')
    {status: 'OK', body: '[0.58|741.91|66.04|133]'}
  end
end



TEST_ADDRESS=0