require 'net/http'

class Lamp < ActiveRecord::Base
  validates_inclusion_of :on, :in => [true, false]
  validates :hue_number, presence: true
  belongs_to :bridge

  def turn_on_off
    on? ? body = {'on' => false} : body = {'on' => true}
    uri = URI.parse("#{base_uri}/state")
    http = Net::HTTP.new(uri.host)
    http.request_put(uri.path, MultiJson.dump(body))
  end

  def on?
    state = MultiJson.load(Net::HTTP.get(URI.parse(base_uri)))['state']
    state['on'] ? true : false
  end

  def base_uri
    "http://#{self.bridge.ip}/api/1234567890/lights/#{self.hue_number}" #stub
  end
end
