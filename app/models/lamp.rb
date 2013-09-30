require 'net/http'

class Lamp < ActiveRecord::Base
  validates_inclusion_of :on, :in => [true, false]
  validates :hue_number, presence: true
  belongs_to :bridge



  def send_command(command, args = nil)
    args ? self.send(command, args) : self.send(command)
  end

  #Views
  def say_colorloop
    colorloop? ? "off" : "on"
  end

  def say_on_off
    on? ? "off" : "on"
  end

  def say_brightness
    "#{state_brightness}%"
  end


  private
  # BRIGHTNESS
  def set_brightness(args)
    body = { 'bri' => args[:brightness] }
    update_lamp(body)
  end

  def state_brightness
    state['bri']
  end

  # COLORLOOP
  def toggle_colorloop
    body = colorloop? ? {'effect' => 'none'} : {'effect' => 'colorloop'}
    update_lamp(body)
  end

  def colorloop?
    state['effect'] == 'colorloop' ? true : false
  end

  # ON/OFF
  def toggle_on_off
    body = on? ? {'on' => false} : {'on' => true}
    update_lamp(body)
  end

  def on?
    state['on']
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
    "http://#{self.bridge.ip}/api/1234567890/lights/#{self.hue_number}" #stub
  end

  def state
    MultiJson.load(Net::HTTP.get(URI.parse(base_uri)))['state']
  end
end
