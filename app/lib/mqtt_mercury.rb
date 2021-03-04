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

  def publish_0_values
    publish({voltage: 0, current: 0, power: 0})
  end

  def publish_switch_on
    publish({switch: "ON"})
  end

  def publish_switch_off
    publish({switch: "OFF"})
  end

end

#m = MqttMercury.new(DEVISES_CONF['mqtt'], DEVISES_CONF['bases'][0], DEVISES_CONF['bases'][0]['devises'][1])
# m.publish({voltage: 230, amperage: 4.24, power: 979})