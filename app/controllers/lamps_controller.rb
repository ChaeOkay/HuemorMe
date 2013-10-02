class LampsController < ApplicationController

  def create
    lamp_array = params[:lamp_ids].split(",")
    lamp_array.each do |id|
      lamp = Lamp.new(bridge_id: params[:bridge_id], light_identifier: id)
      unless lamp.save
        flash[:notice] = "An error occured while saving your lamps"
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
