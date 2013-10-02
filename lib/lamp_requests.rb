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

  def adjust_brightness(args)
    self.brightness = args[:brightness]
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
