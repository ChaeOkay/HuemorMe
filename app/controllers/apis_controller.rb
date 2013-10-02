require 'json'

class ApisController < ApplicationController

  def show
    user = User.find_by_secret_token(params[:secret_token])
    ip = user.bridge.ip
    lamp_commands = {}
    user.lamps.each do |lamp|
      id = lamp.light_identifier
      lamp_commands[id] = {
                            (lamp.on ? "turn_on" : "turn_off") => nil,
                            (lamp.effect == "colorloop" ? "colorloop_on" : "colorloop_off") => nil,
                            "set_brightness" => lamp.brightness
                          } 
    end
    
    data = [ ip, lamp_commands]
    render json: data
  end

end