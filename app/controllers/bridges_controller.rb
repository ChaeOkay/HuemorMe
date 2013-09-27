class BridgesController < ApplicationController

  def new
    @bridge = Bridge.new
  end

  def create
    # user = User.find(1) #stub
    ip = get_local_ip
    bridge = Bridge.new(user_id: current_user.id, ip: ip )
    
    bridge_response = register_user(ip)
    if bridge_response['error']
      flash[:message] = "Parse the error" #stub
      redirect_to new_user_bridge_path(current_user) #stub
    else
      bridge.save
      redirect_to new_bridge_lamp_path(bridge)
    end
  end

end