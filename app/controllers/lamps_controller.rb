class LampsController < ApplicationController

  def create
    bridge = Bridge.find(params[:bridge_id])
    get_lights(bridge).each do |lamp|
      new_lamp = Lamp.new(bridge: bridge, hue_number: lamp)
      unless new_lamp.save
        redirect_to bridge_path(bridge), message: "Error finding lamp"
        return
      end
    end
    redirect_to user_path(current_user)
  end


  def update
    @lamp = Lamp.find(params[:id])
    @lamp.turn_on_off
    redirect_to user_path(current_user), notice: "Lamp is switched #{@lamp.say_on_off}"
  end
end
