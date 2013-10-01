class BridgesController < ApplicationController

  def new
    @bridge = Bridge.new
  end

  def create
    ip = get_local_ip
    device_id = get_device_id

    if ip && device_id == false
      flash[:notice] = "Unable to connect to http://www.meethue.com"
      redirect_to user_path(current_user)
    else

      bridge = Bridge.new(user_id: current_user.id, ip: ip, device_id: device_id )
      bridge_response = register_user(ip)

      if bridge_response['error'] #No error handling in place
        redirect_to new_user_bridge_path(current_user), notice: bridge_response['error']
      elsif bridge_response == "Connection not made"
        flash[:notice] = "Unable to connect to your bridge, connection refused"
        redirect_to user_path(current_user)
      else
        bridge.save
        redirect_to bridge_path(bridge)
      end
    end
  end

  def show
    @bridge = Bridge.find(params[:id])
  end

  def edit
    @bridge = current_user.bridges.first
  end

  def update
    ip = get_local_ip
    bridge = Bridge.find(params[:id])
    bridge.update_attributes(ip: ip)
    bridge_response = register_user(ip)
    if bridge_response['error']
      redirect_to edit_user_bridge_path(current_user, bridge), notice: bridge_response['error']
    else
      bridge.save
      redirect_to user_path(current_user)
    end
  end
end
