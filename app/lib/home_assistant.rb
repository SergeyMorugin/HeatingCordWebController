class HomeAssistant

  def register
  end

  def pub(data)
    c = MQTT::Client.connect('192.168.1.55')
    c.publish('zigbee2mqtt/bridge/event', '{"data":{"friendly_name":"0x00158d000205d552","ieee_address":"0x00158d000205d552"},"type":"device_joined"}')

    c.publish('zigbee2mqtt/bridge/event', '{"data":{"friendly_name":"0x00158d000205d552","ieee_address":"0x00158d000205d552","status":"started"},"type":"device_interview"}')

    c.publish('zigbee2mqtt/bridge/event', '{"data":{"friendly_name":"0x00158d000205d552","ieee_address":"0x00158d000205d552"},"type":"device_announce"}')

    c.publish('zigbee2mqtt/0x00158d000205d552', '{"battery":90,"battery_low":false,"carbon_monoxide":false,"linkquality":18,"tamper":false,"voltage":2900}')

    c.publish('zigbee2mqtt/bridge/event', '{"data":{"definition":{"description":"Smart carbon monoxide sensor","exposes":[{"access":1,"description":"Indicates if CO (carbon monoxide) is detected","name":"carbon_monoxide","property":"carbon_monoxide","type":"binary","value_off":false,"value_on":true},{"access":1,"description":"Indicates if the battery of this device is almost empty","name":"battery_low","property":"battery_low","type":"binary","value_off":false,"value_on":true},{"access":1,"description":"Indicates whether the device is tampered","name":"tamper","property":"tamper","type":"binary","value_off":false,"value_on":true},{"access":1,"description":"Remaining battery in %","name":"battery","property":"battery","type":"numeric","unit":"%","value_max":100,"value_min":0},{"access":1,"description":"Link quality (signal strength)","name":"linkquality","property":"linkquality","type":"numeric","unit":"lqi","value_max":255,"value_min":0}],"model":"SCA01ZB","supports_ota":false,"vendor":"Feibit"},"friendly_name":"0x00158d000205d552","ieee_address":"0x00158d000205d552","status":"successful","supported":true},"type":"device_interview"}')

    #registration
    c.publish 'homeassistant/binary_sensor/0x00158d000205d552/carbon_monoxide/config', '{"availability":[{"topic":"zigbee2mqtt/bridge/state"}],"device":{"identifiers":["zigbee2mqtt_0x00158d000205d552"],"manufacturer":"Feibit","model":"Smart carbon monoxide sensor (SCA01ZB)","name":"0x00158d000205d552","sw_version":"Zigbee2MQTT 1.17.1"},"device_class":"safety","json_attributes_topic":"zigbee2mqtt/0x00158d000205d552","name":"0x00158d000205d552 carbon monoxide","payload_off":false,"payload_on":true,"state_topic":"zigbee2mqtt/0x00158d000205d552","unique_id":"0x00158d000205d552_carbon_monoxide_zigbee2mqtt","value_template":"{{ value_json.carbon_monoxide }}"}'
    c.publish 'homeassistant/binary_sensor/0x00158d000205d552/battery_low/config', '{"availability":[{"topic":"zigbee2mqtt/bridge/state"}],"device":{"identifiers":["zigbee2mqtt_0x00158d000205d552"],"manufacturer":"Feibit","model":"Smart carbon monoxide sensor (SCA01ZB)","name":"0x00158d000205d552","sw_version":"Zigbee2MQTT 1.17.1"},"device_class":"battery","json_attributes_topic":"zigbee2mqtt/0x00158d000205d552","name":"0x00158d000205d552 battery low","payload_off":false,"payload_on":true,"state_topic":"zigbee2mqtt/0x00158d000205d552","unique_id":"0x00158d000205d552_battery_low_zigbee2mqtt","value_template":"{{ value_json.battery_low }}"}'
    c.publish 'homeassistant/binary_sensor/0x00158d000205d552/tamper/config', '{"availability":[{"topic":"zigbee2mqtt/bridge/state"}],"device":{"identifiers":["zigbee2mqtt_0x00158d000205d552"],"manufacturer":"Feibit","model":"Smart carbon monoxide sensor (SCA01ZB)","name":"0x00158d000205d552","sw_version":"Zigbee2MQTT 1.17.1"},"json_attributes_topic":"zigbee2mqtt/0x00158d000205d552","name":"0x00158d000205d552 tamper","payload_off":false,"payload_on":true,"state_topic":"zigbee2mqtt/0x00158d000205d552","unique_id":"0x00158d000205d552_tamper_zigbee2mqtt","value_template":"{{ value_json.tamper }}"}'
    c.publish 'homeassistant/sensor/0x00158d000205d552/battery/config', '{"availability":[{"topic":"zigbee2mqtt/bridge/state"}],"device":{"identifiers":["zigbee2mqtt_0x00158d000205d552"],"manufacturer":"Feibit","model":"Smart carbon monoxide sensor (SCA01ZB)","name":"0x00158d000205d552","sw_version":"Zigbee2MQTT 1.17.1"},"device_class":"battery","json_attributes_topic":"zigbee2mqtt/0x00158d000205d552","name":"0x00158d000205d552 battery","state_topic":"zigbee2mqtt/0x00158d000205d552","unique_id":"0x00158d000205d552_battery_zigbee2mqtt","unit_of_measurement":"%","value_template":"{{ value_json.battery }}"}'
    c.publish 'homeassistant/sensor/0x00158d000205d552/linkquality/config', '{"availability":[{"topic":"zigbee2mqtt/bridge/state"}],"device":{"identifiers":["zigbee2mqtt_0x00158d000205d552"],"manufacturer":"Feibit","model":"Smart carbon monoxide sensor (SCA01ZB)","name":"0x00158d000205d552","sw_version":"Zigbee2MQTT 1.17.1"},"icon":"mdi:signal","json_attributes_topic":"zigbee2mqtt/0x00158d000205d552","name":"0x00158d000205d552 linkquality","state_topic":"zigbee2mqtt/0x00158d000205d552","unique_id":"0x00158d000205d552_linkquality_zigbee2mqtt","unit_of_measurement":"lqi","value_template":"{{ value_json.linkquality }}"}'
    c.publish 'zigbee2mqtt/bridge/devices', '[{"definition":null,"endpoints":{"1":{"bindings":[],"clusters":{"input":[],"output":[]},"configured_reportings":[]},"10":{"bindings":[],"clusters":{"input":[],"output":[]},"configured_reportings":[]},"11":{"bindings":[],"clusters":{"input":["ssIasAce"],"output":["ssIasZone","ssIasWd"]},"configured_reportings":[]},"110":{"bindings":[],"clusters":{"input":[],"output":[]},"configured_reportings":[]},"12":{"bindings":[],"clusters":{"input":[],"output":[]},"configured_reportings":[]},"13":{"bindings":[],"clusters":{"input":["genOta"],"output":[]},"configured_reportings":[]},"2":{"bindings":[],"clusters":{"input":[],"output":[]},"configured_reportings":[]},"242":{"bindings":[],"clusters":{"input":[],"output":[]},"configured_reportings":[]},"3":{"bindings":[],"clusters":{"input":[],"output":[]},"configured_reportings":[]},"4":{"bindings":[],"clusters":{"input":[],"output":[]},"configured_reportings":[]},"47":{"bindings":[],"clusters":{"input":[],"output":[]},"configured_reportings":[]},"5":{"bindings":[],"clusters":{"input":[],"output":[]},"configured_reportings":[]},"6":{"bindings":[],"clusters":{"input":[],"output":[]},"configured_reportings":[]},"8":{"bindings":[],"clusters":{"input":[],"output":[]},"configured_reportings":[]}},"friendly_name":"Coordinator","ieee_address":"0x00124b0014d9b30e","interview_completed":true,"interviewing":false,"network_address":0,"supported":false,"type":"Coordinator"},{"date_code":"20171215","definition":{"description":"Smart carbon monoxide sensor","exposes":[{"access":1,"description":"Indicates if CO (carbon monoxide) is detected","name":"carbon_monoxide","property":"carbon_monoxide","type":"binary","value_off":false,"value_on":true},{"access":1,"description":"Indicates if the battery of this device is almost empty","name":"battery_low","property":"battery_low","type":"binary","value_off":false,"value_on":true},{"access":1,"description":"Indicates whether the device is tampered","name":"tamper","property":"tamper","type":"binary","value_off":false,"value_on":true},{"access":1,"description":"Remaining battery in %","name":"battery","property":"battery","type":"numeric","unit":"%","value_max":100,"value_min":0},{"access":1,"description":"Link quality (signal strength)","name":"linkquality","property":"linkquality","type":"numeric","unit":"lqi","value_max":255,"value_min":0}],"model":"SCA01ZB","supports_ota":false,"vendor":"Feibit"},"endpoints":{"1":{"bindings":[],"clusters":{"input":["genBasic","genIdentify","genTime","genOta","genPowerCfg","ssIasZone","ssIasAce","touchlink"],"output":["genGroups","genIdentify","genPowerCfg","ssIasZone","ssIasAce"]},"configured_reportings":[]}},"friendly_name":"0x00158d000205d552","ieee_address":"0x00158d000205d552","interview_completed":true,"interviewing":false,"model_id":"FNB56-COS06FB1.7","network_address":9914,"power_source":"Battery","software_build_id":"\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000","supported":true,"type":"EndDevice"}]'



    # data
    c.publish 'homeassistant/binary_sensor/0x00158d000205d552/linkquality/config', nil
    c.publish 'zigbee2mqtt/0x00158d000205d552', '{"battery":90,"battery_low":false,"carbon_monoxide":false,"linkquality":18,"tamper":false,"voltage":2900}'



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
    end

    mqtt_client.disconnect
  end

  def register_devise(mqtt_client, base, devise)
    request = devise_struct(devise)

    mqtt_client.publish "#{base['id']}/bridge/devices", request.to_json
  end

  def devise_struct(devise)
    [
        {
            "date_code":"20171215",
            "definition":{
                "description": devise['model'],
                "exposes":
                    devise['parameters'].map do |param|
                        param['access'] = 1
                        param['property'] = param['name']
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
            "model_id":"FNB56-COS06FB1.7",
            #"network_address":9914,
            #"power_source":"Battery",
            "software_build_id":"\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000",
            "supported":true,
            "type":"EndDevice"
        }
    ]
  end

  def register_parameter(mqtt_client, base, devise, parameter)
    request = parameter_struct(base['id'],
                               devise['id'],
                               parameter['name'],
                               parameter['unit'],
                               devise['vendor'],
                               devise['model'],
                               parameter['icon'])

    mqtt_client.publish("homeassistant/sensor/#{devise['id']}/#{parameter['name']}/config", payload=request.to_json, retain=true)
    #mqtt_client.publish "test/test", request.to_json
  end
  # ha = HomeAssistant.new
  # ha.register_parameter(DEVISES_CONF['bases'][0], DEVISES_CONF['bases'][0]['devises'][0], DEVISES_CONF['bases'][0]['devises'][0]['parameters'][0])

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
        "unit_of_measurement": unit,
        "value_template":"{{ value_json.#{param_id} }}"
    }
  end

  def test4
    #'zigbee2mqtt/bridge/event',

    {
      "type":"device_interview",
      "data": {
        "friendly_name":"0x00158d000205d552",
        "ieee_address":"0x00158d000205d552",
        "status":"successful",
        "supported":true,
        "definition": {
           "description":"Smart carbon monoxide sensor",
           "model":"SCA01ZB",
           "supports_ota":false,
           "vendor":"Feibit",
           "exposes":[
               {
                   "access":1,
                   "description":"Indicates if CO (carbon monoxide) is detected",
                   "name":"carbon_monoxide","
                   property":"carbon_monoxide",
                   "type":"binary",
                   "value_off":false,
                   "value_on":true
               },{
                   "access":1,
                   "description":"Indicates if the battery of this device is almost empty",
                   "name":"battery_low",
                   "property":"battery_low",
                   "type":"binary",
                   "value_off":false,
                   "value_on":true
               },{
                   "access":1,
                   "description":"Indicates whether the device is tampered",
                   "name":"tamper",
                   "property":"tamper",
                   "type":"binary",
                   "value_off":false,
                   "value_on":true
               },{
                   "access":1,
                   "description":"Remaining battery in %",
                   "name":"battery",
                   "property":"battery",
                   "type":"numeric",
                   "unit":"%",
                   "value_max":100,
                   "value_min":0
               },{
                   "access":1,
                   "description":"Link quality (signal strength)",
                   "name":"linkquality",
                   "property":"linkquality",
                   "type":"numeric",
                   "unit":"lqi",
                   "value_max":255,
                   "value_min":0
               }
           ],
        }
      }
    }

  end

  def test3
    {
        "availability":[{"topic":"zigbee2mqtt/bridge/state"}],
        "device":{
            "identifiers":["zigbee2mqtt_0x00158d000205d552"],
            "manufacturer":"Feibit",
            "model":"Smart carbon monoxide sensor (SCA01ZB)",
            "name":"0x00158d000205d552",
            "sw_version":"Zigbee2MQTT 1.17.1"
        },
        "icon":"mdi:signal",
        "json_attributes_topic":"zigbee2mqtt/0x00158d000205d552",
        "name":"0x00158d000205d552 linkquality",
        "state_topic":"zigbee2mqtt/0x00158d000205d552",
        "unique_id":"0x00158d000205d552_linkquality_zigbee2mqtt",
        "unit_of_measurement":"lqi",
        "value_template":"{{ value_json.linkquality }}"
    }
  end

  def test1
    {
        "availability":[{"topic":"zigbee2mqtt/bridge/state"}],
        "device":{
            "identifiers":["zigbee2mqtt_0x00158d000205d552"],
            "manufacturer":"Feibit",
            "model":"Smart carbon monoxide sensor (SCA01ZB)",
            "name":"0x00158d000205d552",
            "sw_version":"Zigbee2MQTT 1.17.1"
        },
        "device_class":"battery",
        "json_attributes_topic":"zigbee2mqtt/0x00158d000205d552",
        "name":"0x00158d000205d552 battery",
        "state_topic":"zigbee2mqtt/0x00158d000205d552",
        "unique_id":"0x00158d000205d552_battery_zigbee2mqtt",
        "unit_of_measurement":"%",
        "value_template":"{{ value_json.battery }}"}

  end

  def test2
    [
        {"definition":null,
         "endpoints":{
             "1":{ "bindings":[], "clusters":{ "input":[], "output":[]}, "configured_reportings":[] },
             "10":{ "bindings":[], "clusters":{"input":[], "output":[]}, "configured_reportings":[]},
             "11": { "bindings":[], "clusters":{"input":["ssIasAce"],"output":["ssIasZone","ssIasWd"]}, "configured_reportings":[] },
             "110":{ "bindings":[], "clusters":{"input":[],"output":[]}, "configured_reportings":[]},
             "12":{ "bindings":[], "clusters":{"input":[],"output":[]}, "configured_reportings":[]},
             "13":{ "bindings":[], "clusters":{"input":["genOta"],"output":[]}, "configured_reportings":[]},
             "2":{ "bindings":[], "clusters":{"input":[],"output":[]}, "configured_reportings":[]},
             "242":{"bindings":[],"clusters":{"input":[],"output":[]},"configured_reportings":[]},
             "3":{"bindings":[],"clusters":{"input":[],"output":[]},"configured_reportings":[]},
             "4":{"bindings":[],"clusters":{"input":[],"output":[]},"configured_reportings":[]},
             "47":{"bindings":[],"clusters":{"input":[],"output":[]},"configured_reportings":[]},
             "5":{"bindings":[],"clusters":{"input":[],"output":[]},"configured_reportings":[]},
             "6":{"bindings":[],"clusters":{"input":[],"output":[]},"configured_reportings":[]},
             "8":{"bindings":[],"clusters":{"input":[],"output":[]},"configured_reportings":[]}
         },
         "friendly_name":"Coordinator",
         "ieee_address":"0x00124b0014d9b30e",
         "interview_completed":true,
         "interviewing":false,
         "network_address":0,
         "supported":false,
         "type":"Coordinator"
        },
        {
            "date_code":"20171215",
            "definition":{
                "description":"Smart carbon monoxide sensor",
                "exposes":[
                    {
                        "access":1,
                        "description":"Indicates if CO (carbon monoxide) is detected",
                        "name":"carbon_monoxide",
                        "property":"carbon_monoxide",
                        "type":"binary",
                        "value_off":false,
                        "value_on":true
                    },{
                        "access":1,
                        "description":"Indicates if the battery of this device is almost empty",
                        "name":"battery_low",
                        "property":"battery_low",
                        "type":"binary",
                        "value_off":false,
                        "value_on":true
                    },{
                        "access":1,
                        "description":"Indicates whether the device is tampered",
                        "name":"tamper",
                        "property":"tamper",
                        "type":"binary",
                        "value_off":false,
                        "value_on":true
                    },{
                        "access":1,
                        "description":"Remaining battery in %",
                        "name":"battery",
                        "property":"battery",
                        "type":"numeric",
                        "unit":"%",
                        "value_max":100,
                        "value_min":0
                    },{
                        "access":1,
                        "description":"Link quality (signal strength)",
                        "name":"linkquality",
                        "property":"linkquality",
                        "type":"numeric",
                        "unit":"lqi",
                        "value_max":255,
                        "value_min":0
                    }
                ],
                "model":"SCA01ZB",
                "supports_ota":false,
                "vendor":"Feibit"
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
            "friendly_name":"0x00158d000205d552",
            "ieee_address":"0x00158d000205d552",
            "interview_completed":true,
            "interviewing":false,
            "model_id":"FNB56-COS06FB1.7",
            "network_address":9914,
            "power_source":"Battery",
            "software_build_id":"\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000",
            "supported":true,
            "type":"EndDevice"
        }
    ]

  end

end