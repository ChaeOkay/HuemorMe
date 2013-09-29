class LampsController < ApplicationController

  def create
    bridge = Bridge.find(params[:bridge_id])
    get_lights(bridge).each do |lamp|
      Lamp.create(bridge: bridge, hue_number: lamp)
    end
    redirect_to user_path(current_user)
  end

  def update
    @lamp = Lamp.find(params[:id])
    @lamp.send_command(params[:lamp][:command])
    redirect_to user_path(current_user)
  end
end
