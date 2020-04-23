require_relative '../../app/lib/crc16'
require_relative '../../app/lib/mercury'

TEST_ADDRESS = 30720528 #123456

RSpec.describe Mercury do
   #Eth485Gateway.new('192.168.1.115', 2000), TEST_ADDRESS) }#
   #let(:mercury){ Mercury.new(io_stub,TEST_ADDRESS)}

  def create_meter(return_data)
    io_stub = double
    allow(io_stub).to receive(:get_data).and_return(return_data)
    Mercury.new(io_stub,TEST_ADDRESS)
  end

  context 'on a test connection command' do
    let(:raw_response) {[0x01, 0xD4, 0xC2, 0x10, 0x2F, 0x01, 0xD4, 0xC2, 0x10, 0x2E, 0x3D]}

    it 'returns its address' do
      mercury = create_meter({status: 'OK', body: raw_response.pack('C*')})
      response = {status: 'OK', data: {address: TEST_ADDRESS}}
      expect(mercury.test_connection).to eq(response)
    end

    it 'returns CRC error if a response is corrupted' do
      raw_response[0] = 0x02 #corrupted byte
      mercury = create_meter({status: 'OK', body: raw_response.pack('C*')})
      response = {status: 'Error', :error_message => "Wrong CRC", body: raw_response.pack('C*')}
      expect(mercury.test_connection).to eq(response)
    end
  end
  
  it 'returns electricity properties' do
    mercury = create_meter({status: 'OK', body: [0x01, 0xD4, 0xC2, 0x10, 0x63, 0x22, 0x78, 0x04, 0x42, 0x00, 0x10, 0x08, 0xEA, 0xFD].pack('C*')})
    response = {:data=>{:amperage=>4.42, :power=>1008, :voltage=>227.8}, :status=>"OK"}    
    expect(mercury.get_UIP).to eq(response)
  end 

  it 'switches on a electricity consumer' do
    mercury = create_meter({status: 'OK', body: [0x01, 0xD4, 0xC2, 0x10, 0x71, 0x4C, 0x28].pack('C*')})
    response = {:status=>"OK"}
    expect(mercury.enable_consumer).to eq(response)
  end 

  it 'switches off a electricity consumer' do
    mercury = create_meter({status: 'OK', body: [0x01, 0xD4, 0xC2, 0x10, 0x71, 0x4C, 0x28].pack('C*')})
    response = {:status=>"OK"}
    expect(mercury.disable_consumer).to eq(response)
  end
end

__END__
#require_relative '../eth485_gateway'

IOAnswer = Struct.new(:status, :data, :error_message)

class IOStub
  def send(buf)
    #puts buf.unpack('C*').map{|i| i.to_s(16)}.to_s
    return {status: 'OK', body: [0x01, 0xD4, 0xC2, 0x10, 0x2F, 0x01, 0xD4, 0xC2, 0x10, 0x2E, 0x3D].pack('C*')} if buf[4].ord == 0x2F
    return {status: 'OK', body: [0x01, 0xD4, 0xC2, 0x10, 0x63, 0x22, 0x78, 0x04, 0x42, 0x00, 0x10, 0x08, 0xEA, 0xFD].pack('C*')} if buf[4].ord == 0x63
    return {status: 'OK', body: [0x01, 0xD4, 0xC2, 0x10, 0x71, 0x4C, 0x28].pack('C*')} if buf[4].ord == 0x71
    buf
  end
end