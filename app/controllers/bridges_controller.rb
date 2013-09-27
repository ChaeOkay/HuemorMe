class BridgesController < ApplicationController

  def new
    @bridge = Bridge.new
  end

  def create
    user = User.find(params[:user_id]) #stub
    ip = get_local_ip
    bridge = Bridge.new(user_id: user.id, ip: ip ) #stub
    
    bridge_response = register_user(ip)
    if bridge_response['error']
      redirect_to new_user_bridge_path(user), notice: "Parse the error" #stub
    else
      bridge.save
      redirect_to bridge_path(bridge)
    end
  end

  def show
    @bridge = Bridge.find(params[:id])
  end

end