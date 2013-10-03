module LampRequests

#GETTERS
  def say_on_off
    self.on ? "off" : "on"
  end

  def say_brightness
    self.brightness
  end

  def say_colorloop
    self.effect == "colorloop" ? "off" : "on"
  end

#SETTERS
  def turn_on
    self.on = true
    self.save
  end

  def turn_off
    self.on = false
    self.save
  end

  def set_color(args)
    self.color = args[:color]
    self.save
  end

  def set_color_and_sat(args)
    self.color = args[:color]
    self.saturation = args[:saturation]
    self.brightness = args[:brightness]
    self.save
  end

  def set_brightness(args)
    self.brightness = args[:brightness]
    self.save
  end

  def turn_colorloop_on
    self.effect = "colorloop"
    self.save
  end

  def turn_colorloop_off
    self.effect = "none"
    self.save
  end
end
