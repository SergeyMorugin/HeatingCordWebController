require 'socket'

class Eth485Gateway

  def initialize (ip, port=2000, delay = 1000)
  	@ip = ip
  	@port = port
  	@socket = nil
  	@delay = delay
  end

  def get_data(buf)    
    begin
      @socket = TCPSocket.new(@ip, @port)      
      #puts "OUT #{buf.unpack('C*').map{|c| "%02X" % c}.to_s}"
      @socket.write buf
      sleep @delay/1000
      response = @socket.recv(100)
      #puts "IN #{response.unpack('C*').map{|c| "%02X" % c}.to_s} - #{response}"
      @socket.close
      return {status: 'Error', error_message: response} if response.include?("Port already in use")
      {status: 'OK', body: response} 
    rescue => e
      {status: 'Error', error_message: e.to_s}
    end
  end

end
