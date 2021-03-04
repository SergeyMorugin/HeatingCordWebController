class HomeAssistant

  def subscribe

    base =  DEVISES_CONF['bases'][0]
    devise = base['devises'][1]
    switcher = devise['parameters'][3]
    path = "#{base['id']}/#{devise['id']}/#{switcher['name']}"
    p switcher



    MQTT::Client.connect(DEVISES_CONF['mqtt']['address']) do |c|
      c.get(path+'/set') do |topic,message|
        puts "#{topic}: #{message}"

        heating_cord = HeatingCord.first

        if message == 'ON'
          mode = HeatingCord::HEATIN_CORD_MANUAL_ON_MODE
        else
          mode = HeatingCord::HEATIN_CORD_OFF_MODE
        end

        result = heating_cord.update_mode(mode)

        if result['status'] = 'OK'
          #DevisesFactory.get_mercury.publish_0_values
          p "Changed mode successfully"
          c.publish "#{base['id']}/#{devise['id']}",  {switcher: message}.to_json
        end

      end
    end
  end






  # base -> devise -> parameter
  #
  def publish(base, devise, payload)
    mqtt_client = MQTT::Client.connect(DEVISES_CONF['mqtt']['address'])
    mqtt_client.publish "#{base['id']}/#{devise['id']}", payload.to_json
    mqtt_client.disconnect
  end
  #HomeAssistant.new.publish(DEVISES_CONF['bases'][0], DEVISES_CONF['bases'][0]['devises'][0], {temperature: -3})

  def register_devises
    mqtt_client = MQTT::Client.connect(DEVISES_CONF['mqtt']['address'])

    DEVISES_CONF['bases'].each do |base|
      base['devises'].each do |devise|
        devise['parameters'].each do |parameter|
          register_parameter(mqtt_client, base, devise, parameter)
        end
        register_devise(mqtt_client, base, devise)
      end
      mqtt_client.publish("#{base['id']}/bridge/state",'online',true)
    end

    mqtt_client.disconnect
  end

  def register_devise(mqtt_client, base, devise)
    request = devise_struct(devise)

    mqtt_client.publish "#{base['id']}/bridge/devices", request.to_json, true
    #p "#{base['id']}/bridge/devices", request
  end

  def devise_struct(devise)
    [
        {
            "date_code":"20171215",
            "definition":{
                "description": devise['model'],
                "exposes":
                    devise['parameters'].map do |param|
                        case param['parameter_type']
                        when 'sensor'
                          param['access'] = 1
                          param['property'] = param['name']
                        when 'switch'
                        else
                          raise
                        end
                        param['parameter_type'] = nil
                        param
                    end,
                "model": devise['model'],
                "supports_ota": false,
                "vendor": devise['vendor']
            },
            "endpoints":{
                "1":{
                    "bindings":[],
                    "clusters":{
                        "input":["genBasic","genIdentify","genTime","genOta","genPowerCfg","ssIasZone","ssIasAce","touchlink"],
                        "output":["genGroups","genIdentify","genPowerCfg","ssIasZone","ssIasAce"]
                    },
                    "configured_reportings":[]}
            },
            "friendly_name": devise['id'],
            #"ieee_address":"0x00158d000205d553",
            "interview_completed":true,
            "interviewing":false,
            #"model_id":"FNB56-COS06FB1.7",
            #"network_address":9914,
            #"power_source":"Battery",
            "software_build_id":"\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000",
            "supported":true,
            "type":"EndDevice"
        }
    ]
  end

  def register_parameter(mqtt_client, base, devise, parameter)
    case parameter['parameter_type']
    when 'sensor'
      request = sensor_parameter_struct(base, devise, parameter)
    when 'switch'
      request = switcher_parameter_struct(base, devise, parameter)
    else
      raise
    end

    mqtt_client.publish("homeassistant/#{parameter['parameter_type']}/#{devise['id']}/#{parameter['name']}/config", request.to_json, true)
    #mqtt_client.publish "test/test", request.to_json
    #p "homeassistant/#{parameter['parameter_type']}/#{devise['id']}/#{parameter['name']}/config", request
  end


  # ha = HomeAssistant.new
  # ha.register_parameter(DEVISES_CONF['bases'][0], DEVISES_CONF['bases'][0]['devises'][0], DEVISES_CONF['bases'][0]['devises'][0]['parameters'][0])

  def sensor_parameter_struct(base, devise, param)
    {
        "availability":[{"topic":"#{base['id']}/bridge/state"}],
        "device":{
            "identifiers":["#{base['id']}_#{devise['id']}"],
            "manufacturer": devise['vendor'],
            "model": devise['model'],
            "name":"#{devise['id']}",
            #"sw_version":"#{base['id']} 0.0.1"
        },
        "device_class": param['name'],
        #"icon": icon,
        "json_attributes_topic":"#{base['id']}/#{devise['id']}",
        "name":"#{devise['id']} #{param['name']}",
        "state_topic":"#{base['id']}/#{devise['id']}",
        "unique_id":"#{devise['id']}_#{param['name']}_#{base['id']}",
        "value_template":"{{ value_json.#{param['name']} }}",
        "unit_of_measurement": param['unit'],
    }
  end

  def switcher_parameter_struct(base, devise, param)
    {
        "command_topic":"#{base['id']}/#{devise['id']}/#{param['name']}/set",
        "payload_off":"OFF",
        "payload_on":"ON",

        "availability":[{"topic":"#{base['id']}/bridge/state"}],
        "device":{
            "identifiers":["#{base['id']}_#{devise['id']}"],
            "manufacturer": devise['vendor'],
            "model": devise['model'],
            "name":"#{devise['id']}",
            #"sw_version":"#{base['id']} 0.0.1"
        },
        #"device_class": param['parameter_type'],
        #"icon": icon,
        "json_attributes_topic":"#{base['id']}/#{devise['id']}",
        "name":"#{devise['id']} #{param['name']}",
        "state_topic":"#{base['id']}/#{devise['id']}",
        "unique_id":"#{devise['id']}_#{param['name']}_#{base['id']}",
        "value_template":"{{ value_json.#{param['name']} }}",
    }
  end

  def parameter_struct(base_id, dev_id, param_id, unit, manufacturer="Ostagram", model="", icon="mdi:signal")
    {
        "availability":[{"topic":"#{base_id}/bridge/state"}],
        "device":{
            "identifiers":["#{base_id}_#{dev_id}"],
            "manufacturer":manufacturer,
            "model":model,
            "name":"#{dev_id}",
            "sw_version":"#{base_id} 0.0.1"
        },
        "device_class": param_id,
        #"icon": icon,
        "json_attributes_topic":"#{base_id}/#{dev_id}",
        "name":"#{dev_id} #{param_id}",
        "state_topic":"#{base_id}/#{dev_id}",
        "unique_id":"#{dev_id}_#{param_id}_#{base_id}",
        "value_template":"{{ value_json.#{param_id} }}",
        "unit_of_measurement": unit,
    }
  end


end