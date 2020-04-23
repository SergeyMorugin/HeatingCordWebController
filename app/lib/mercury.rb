
class Mercury
  include Crc16
  GET_SERIAL_NUMBER_CMD = [0x2F]
  GET_U_I_P_CMD = [0x63]
  ENABLE_CONSUMER_CMD = [0x71, 0x00]
  DISABLE_CONSUMER_CMD = [0x71, 0xAA]
  EMULATION_BUTTON_PRESS_CMD = [0x71, 0x5A] # I don't know what for this?

  def initialize (io_dev, address = 0)
    @io_dev = io_dev
    @address = address
  end

  
  def test_connection
    response = form_cmd_and_send GET_SERIAL_NUMBER_CMD.pack('C*')
    return response if response[:status] != 'OK'    
    address = bytes_to_int(response[:body][5..8]) 
    {status: 'OK', data: {address: address}}
  end

  def get_UIP
    response = form_cmd_and_send GET_U_I_P_CMD.pack('C*')
    return response if response[:status] != 'OK'    
    #puts response_body.unpack('C*').map{|c| "%02X" % c}.to_s
    response_body = response[:body]
    voltage = hex_to_int(response_body[5..6]).to_f/10 
    amperage = hex_to_int(response_body[7..8]).to_f/100
    electric_power = hex_to_int(response_body[9..11])
    {status: 'OK', data: {voltage:voltage, amperage:amperage, power: electric_power}}
  end

  def enable_consumer
    response = form_cmd_and_send ENABLE_CONSUMER_CMD.pack('C*')
    return response if response[:status] != 'OK'        
    
    response = form_cmd_and_send EMULATION_BUTTON_PRESS_CMD.pack('C*')
    return response if response[:status] != 'OK'
    
    {status: 'OK'}
  end

  def disable_consumer
    response = form_cmd_and_send DISABLE_CONSUMER_CMD.pack('C*')
    return response if response[:status] != 'OK'    
    {status: 'OK'}
  end



private

  def form_cmd_and_send(buf)
    cmd = int_to_bytes(@address) + buf
    cmd = cmd + short_to_bytes(crc16(cmd))
    response = @io_dev.get_data(cmd)
    return response if response[:status] != 'OK'
    response_body = response[:body]
    return response.merge({status: 'Error', error_message: 'Wrong CRC' }) if !check_crc(response_body)
    return response.merge({status: 'Error', error_message: 'Wrong cmd number in response' }) if cmd[4] != response_body[4]
    response    
  end

  def check_crc(response)
    crc = response[-2..-1]
    responde_body = response[0..-3]
    #puts "in crc #{bytes_to_int(crc)} - "
    #puts "calc crc #{crc16(responde_body)}"

    crc16(responde_body) == bytes_to_short(crc)
  end

  def hex_to_int(hex)
    hex.unpack('C*').map{|c| "%02X" % c}.join.to_i
  end

  def int_to_bytes(int)
    [int].pack('N')
  end

  def short_to_bytes(short)
    [short].pack('n')
  end

  def bytes_to_short(bytes)
    bytes.unpack('n').first
  end

  def bytes_to_int(bytes)
    bytes.unpack('N').first
  end
end
#30720528