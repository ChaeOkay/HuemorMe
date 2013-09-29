require 'net/http'

class Lamp < ActiveRecord::Base
  validates_inclusion_of :on, :in => [true, false]
  validates :hue_number, presence: true
  belongs_to :bridge

  def send_command(command)
    self.send(command)
  end

  def on?
    state['on'] ? true : false
  end

  def say_on_off
    on? ? "off" : "on"
  end


  private
  # Methods for bridge command
  def turn_on_off
    body = on? ? {'on' => false} : {'on' => true}
    update_lamp(body)
  end


  # Methods for sending bridge comman
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
