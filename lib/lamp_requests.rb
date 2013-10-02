module LampRequests

#GETTERS
  def say_on_off
    on ? "off" : "on"
  end

  def say_brightness
    brightness
  end

  def say_colorloop
    effect == "colorloop" ? "off" : "on"
  end

#SETTERS
  def toggle_on_off
    lamp.on = lamp.on ? false : true
  end

  def adjust_brightness(args)
    lamp.brightness = args[:brightness]
  end

  def toggle_colorloop(args)
    lamp.effect = args[:effect]
  end

end
