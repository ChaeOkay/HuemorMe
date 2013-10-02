module LampRequests

#Views
  def say_colorloop
    colorloop? ? "off" : "on"
  end

  def say_on_off
    on? ? "off" : "on"
  end

  def say_brightness
    "#{state_brightness}"
  end

# BRIGHTNESS
  def adjust_brightness(args)
    lamp.brightness = args[:brightness]
  end

  # COLORLOOP
  def toggle_colorloop(args)
    lamp.effect = args[:effect]
  end

  # ON/OFF
  def toggle_on_off
    lamp.on = lamp.on ? false : true
  end


  #####################################
  # Methods for sending bridge commands
  def update_lamp(msg)
    address.request_put(parsed_uri.path, MultiJson.dump(msg))
  end

  def address
    Net::HTTP.new(parsed_uri.host)
  end

  def parsed_uri
    URI.parse("#{base_uri}/state")
  end

  def base_uri
    "http://#{self.bridge.ip}/api/1234567890/lights/#{self.light_identifier}" #stub
  end

  def state
    MultiJson.load(Net::HTTP.get(URI.parse(base_uri)))['state']
  end
end
