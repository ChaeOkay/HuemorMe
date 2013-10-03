class LampsController < ApplicationController

  def create
    flash[:lamp] = []
    if params[:lamp_ids] != ""
      lamp_array = params[:lamp_ids].split(",")
      lamp_array.each do |id|
        lamp = Lamp.new(bridge_id: params[:bridge_id], light_identifier: id)
        lamp.save
      end
    else
      flash[:lamp] << "No lights connected to bridge."
    end
    redirect_to setup_path
  end

  def settings
    @lamp = Lamp.find(params[:id])
    @lamp.send_command(params[:lamp][:command], params[:lamp][:data])
    render json: {}
  end

  def show
    @lamp = Lamp.find(params[:id])
  end
end
