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
      redirect_to new_user_bridge_path(current_user), notice: "An error occured while saving your bridge, please try again."
    end
  end

  def show
    @bridge = Bridge.find(params[:id])
  end

  def edit
    @bridge = current_user.bridges.first
  end

  # def update
  #   ip = get_local_ip
  #   bridge = Bridge.find(params[:id])
  #   bridge.update_attributes(ip: ip)
  #   bridge_response = register_user(ip)
  #   if bridge_response['error']
  #     redirect_to edit_user_bridge_path(current_user, bridge), notice: bridge_response['error']
  #   else
  #     bridge.save
  #     redirect_to user_path(current_user)
  #   end
  # end

  private

  def bridge_params
      params.require(:bridge).permit(:device_id, :ip)
  end
end
