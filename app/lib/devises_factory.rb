class DevisesFactory

  def self.get_mercury
    MqttMercury.new(DEVISES_CONF['mqtt'], DEVISES_CONF['bases'][0], DEVISES_CONF['bases'][0]['devises'][1])
  end

  def self.get_bme280
    MqttBme280.new(DEVISES_CONF['mqtt'], DEVISES_CONF['bases'][0], DEVISES_CONF['bases'][0]['devises'][0])
  end
end