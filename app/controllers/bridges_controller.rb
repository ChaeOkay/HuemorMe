class BridgesController < ApplicationController

  def new
    @bridge = Bridge.new
  end

  def create
    bridge = Bridge.new(bridge_params)
    bridge.user_id = current_user.id
    if bridge.save
      redirect_to bridge_path(bridge)
    else
      redirect_to new_user_bridge_path(current_user), flash.now[:error] => "An error occured while saving your bridge, please try again."
    end
  end

  def show
    @bridge = Bridge.find(params[:id])
  end

  private

  def bridge_params
      params.require(:bridge).permit(:device_id, :ip)
  end
end
