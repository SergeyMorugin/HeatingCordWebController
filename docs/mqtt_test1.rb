class MqttTest1




  def test_switcher2
    'zigbee2mqtt/bridge/devices'
    [
        {
            "date_code":"",
            "definition":{
                "description":"2 gang switch module with neutral wire",
                "exposes":[
                    {
                        "endpoint":"l1",
                        "features":[
                            {
                                "access":7,
                                "description":"On/off state of the switch",
                                "endpoint":"l1",
                                "name":"state",
                                "property":"state_l1",
                                "type":"binary",
                                "value_off":"OFF",
                                "value_on":"ON",
                                "value_toggle":"TOGGLE"
                            }
                        ],
                        "type":"switch"
                    },{
                        "endpoint":"l2","features":[{"access":7,"description":"On/off state of the switch","endpoint":"l2","name":"state","property":"state_l2","type":"binary","value_off":"OFF","value_on":"ON","value_toggle":"TOGGLE"}],"type":"switch"
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
                "model":"QS-Zigbee-S04-2C-LN",
                "supports_ota":false,
                "vendor":"Lonsonho"
            },
            "endpoints":{
                "1":{"bindings":[{"cluster":"genOnOff","target":{"endpoint":1,"ieee_address":"0x00124b0014d9b30e","type":"endpoint"}}],"clusters":{"input":["genBasic","genGroups","genScenes","genOnOff","genOnOff"],"output":["genOta","genTime"]},"configured_reportings":[]},
                "2":{"bindings":[{"cluster":"genOnOff","target":{"endpoint":1,"ieee_address":"0x00124b0014d9b30e","type":"endpoint"}}],"clusters":{"input":["genGroups","genScenes","genOnOff","genOnOff"],"output":[]},"configured_reportings":[]}
            },
            "friendly_name":"0x5c0272fffec89ec2",
            "ieee_address":"0x5c0272fffec89ec2",
            "interview_completed":true,
            "interviewing":false,
            "model_id":"TS0003",
            "network_address":17171,
            "power_source":"Mains (single phase)",
            "supported":true,
            "type":"Router"
        },

        {
            "definition":null,
            "endpoints":
                {
                    "1":{"bindings":[],"clusters":{"input":[],"output":[]},"configured_reportings":[]},
                    "10":{"bindings":[],"clusters":{"input":[],"output":[]},"configured_reportings":[]},
                    "11":{"bindings":[],"clusters":{"input":["ssIasAce"],"output":["ssIasZone","ssIasWd"]},"configured_reportings":[]},
                    "110":{"bindings":[],"clusters":{"input":[],"output":[]},"configured_reportings":[]},
                    "12":{"bindings":[],"clusters":{"input":[],"output":[]},"configured_reportings":[]},
                    "13":{"bindings":[],"clusters":{"input":["genOta"],"output":[]},"configured_reportings":[]},
                    "2":{"bindings":[],"clusters":{"input":[],"output":[]},"configured_reportings":[]},
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
        },{
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
                    },
                    {
                        "access":1, "description":"Link quality (signal strength)","name":"linkquality","property":"linkquality","type":"numeric","unit":"lqi","value_max":255,"value_min":0
                    }
                ],
                "model":"SCA01ZB",
                "supports_ota":false,
                "vendor":"Feibit"
            },
            "endpoints": {
                "1":{
                    "bindings":[{"cluster":"genPowerCfg","target":{"endpoint":1,"ieee_address":"0x00124b0014d9b30e","type":"endpoint"}}],
                    "clusters":{
                        "input":["genBasic","genIdentify","genTime","genOta","genPowerCfg","ssIasZone","ssIasAce","touchlink"],
                        "output":["genGroups","genIdentify","genPowerCfg","ssIasZone","ssIasAce"]
                    },
                    "configured_reportings":[
                        {
                            "attribute":"batteryPercentageRemaining",
                            "cluster":"genPowerCfg",
                            "maximum_report_interval":62000,
                            "minimum_report_interval":3600,
                            "reportable_change":0
                        }
                    ]
                }
            },
            "friendly_name":"0x00158d000205d552",
            "ieee_address":"0x00158d000205d552",
            "interview_completed":true,
            "interviewing":false,
            "model_id":"FNB56-COS06FB1.7",
            "network_address":65018,
            "power_source":"Battery",
            "software_build_id":"\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000",
            "supported":true,
            "type":"EndDevice"
        }
    ]

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

  def test_switcher1
    'homeassistant/switch/0x5c0272fffec89ec2/switch_l1/config'

    {
        "command_topic":"zigbee2mqtt/0x5c0272fffec89ec2/l1/set",
        "payload_off":"OFF",
        "payload_on":"ON",

        "availability": [{"topic":"zigbee2mqtt/bridge/state"}],
        "device":{
            "identifiers":["zigbee2mqtt_0x5c0272fffec89ec2"],
            "manufacturer":"Lonsonho",
            "model":"2 gang switch module with neutral wire (QS-Zigbee-S04-2C-LN)",
            "name":"0x5c0272fffec89ec2",
            "sw_version":"Zigbee2MQTT 1.17.1"
        },
        "json_attributes_topic":"zigbee2mqtt/0x5c0272fffec89ec2",
        "name":"0x5c0272fffec89ec2 l1",
        "state_topic":"zigbee2mqtt/0x5c0272fffec89ec2",
        "unique_id":"0x5c0272fffec89ec2_switch_l1_zigbee2mqtt",
        "value_template":"{{ value_json.state_l1 }}"
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