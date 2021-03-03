class MqttMercury
  attr_accessor :mqtt_server
  attr_accessor :base
  attr_accessor :devise

  def initialize(mqtt_server, base , devise)
    @mqtt_server = mqtt_server
    @base = base
    @devise = devise
  end

  def publish(payload)
    fix_payload = payload
    fix_payload[:current] = payload[:amperage] if fix_payload[:current].nil?

    mqtt_client = MQTT::Client.connect(@mqtt_server['address'])
    mqtt_client.publish "#{@base['id']}/#{@devise['id']}", fix_payload.to_json
    mqtt_client.disconnect
  end


end

#m = MqttMercury.new(DEVISES_CONF['mqtt'], DEVISES_CONF['bases'][0], DEVISES_CONF['bases'][0]['devises'][1])
# m.publish({voltage: 230, amperage: 4.24, power: 979})