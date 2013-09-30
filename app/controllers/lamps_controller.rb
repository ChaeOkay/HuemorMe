class LampsController < ApplicationController

  def create
    bridge = Bridge.find(params[:bridge_id])
    get_lights(bridge).each do |lamp|
      lamp = Lamp.new(bridge: bridge, hue_number: lamp)
      unless lamp.save
        flash[:notice] = lamp.errors.messages[:hue_number]
      end
    end
    redirect_to user_path(current_user)
  end

  def settings
    @lamp = Lamp.find(params[:id])
    @lamp.send_command(params[:lamp][:command], params[:lamp][:data])
    redirect_to user_path(current_user)
  end
end
