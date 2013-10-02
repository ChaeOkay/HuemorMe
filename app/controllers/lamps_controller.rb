class LampsController < ApplicationController

  def create
    lamp_array = params[:lamp_ids].split(",")
    flash[:lamp] = []
    lamp_array.each do |id|
      lamp = Lamp.new(bridge_id: params[:bridge_id], light_identifier: id)
      unless lamp.save
        unless lamp.errors.full_messages == ["Light identifier Cannot register the same light."]
          flash[:lamp] << lamp.errors.full_messages
        end
      end
    end
    redirect_to setup_path
  end

  def settings
    @lamp = Lamp.find(params[:id])
    @lamp.send_command(params[:lamp][:command], params[:lamp][:data])
    redirect_to user_path(current_user)
  end
end
