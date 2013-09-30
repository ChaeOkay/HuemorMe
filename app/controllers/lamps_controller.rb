class LampsController < ApplicationController

  def create
    bridge = Bridge.find(params[:bridge_id])
    get_lights(bridge).each do |lamp|
      Lamp.create(bridge: bridge, hue_number: lamp,
        group_id: current_user.groups.find_by_name("All").id)
    end
    redirect_to user_path(current_user)
  end

  def update
    @lamp = Lamp.find(params[:id])
    @lamp.send_command(params[:lamp][:command], params[:lamp][:data])
    redirect_to user_path(current_user)
  end
end
