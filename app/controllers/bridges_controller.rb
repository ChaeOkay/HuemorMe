class BridgesController < ApplicationController

  def new
    @bridge = Bridge.new
  end

  def create
    ip = get_local_ip
    bridge = Bridge.new(user_id: current_user.id, ip: ip )
    
    bridge_response = register_user(ip)
    if bridge_response['error']
      redirect_to new_user_bridge_path(current_user), notice: "Parse the error"
    else
      bridge.save
      redirect_to bridge_path(bridge)
    end
  end

  def show
    @bridge = Bridge.find(params[:id])
  end

end