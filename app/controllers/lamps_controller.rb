class LampsController < ApplicationController

  def create
    bridge = Bridge.find(params[:bridge_id])
    bridge_response = get_lights(bridge)
    bridge_response['lights'].keys.each do |lamp|
      new_lamp = Lamp.new(bridge: bridge, hue_number: lamp)
      unless new_lamp.save
        flash[:message] = "Error finding lamp"
      end
    end

    if flash[:message]
      redirect_to bridge_path(bridge)
    else
      redirect_to user_path(current_user)
    end
  end

  def toggle
    lamp = Lamp.find(params[:id])
    lamp.turn_on_off
    binding.pry

    redirect_to user_path, notice: "Lamp is switched #{@lamp.on}"
  end
end
