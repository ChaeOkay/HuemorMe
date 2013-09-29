require 'net/http'

class Lamp < ActiveRecord::Base
  validates_inclusion_of :on, :in => [true, false]
  validates :hue_number, presence: true
  belongs_to :bridge

  def on?
    state['on'] ? true : false
  end

  def turn_on_off
    body = on? ? {'on' => false} : {'on' => true}
    address.request_put(parsed_uri.path, MultiJson.dump(body))
  end

  def say_on_off
    on? ? "off" : "on"
  end


  private

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
