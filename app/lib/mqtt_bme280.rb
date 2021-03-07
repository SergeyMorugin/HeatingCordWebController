class MqttBme280
  attr_accessor :mqtt_server
  attr_accessor :base
  attr_accessor :devise

  def initialize(mqtt_server, base , devise)
    @mqtt_server = mqtt_server
    @base = base
    @devise = devise
  end

  def publish(payload)

    mqtt_client = MQTT::Client.connect(@mqtt_server['address'])
    mqtt_client.publish "#{@base['id']}/#{@devise['id']}", round_values(payload).to_json
    mqtt_client.disconnect
  end

  def round_values(values)
    values['temperature'] = values['temperature'].round(1)
    values['humidity'] = values['humidity'].round
    values['pressure'] = values['pressure'].round
    values
  end

end

#m = MqttBme280.new(DEVISES_CONF['mqtt'], DEVISES_CONF['bases'][0], DEVISES_CONF['bases'][0]['devises'][0])
# m.publish(3.9,36.55, 989)
