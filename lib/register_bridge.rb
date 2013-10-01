module RegisterBridge
  require 'net/http'

  def get_local_ip 
    get_user_configs["internalipaddress"]
  end

  def get_device_id
    get_user_configs["id"]
  end

  def get_user_configs
    #returns a hash including id, internalipaddress, and macaddress
    meethue = 'http://www.meethue.com/api/nupnp'
    meethue_json = MultiJson.load(Net::HTTP.get(URI.parse(meethue)))
    meethue_json.first
  end


  def register_user(bridge_ip)
    body = {
      devicetype: "HuemorMe",
      username: current_user.username
    }

    uri = URI.parse("http://#{bridge_ip}/api")
    http = Net::HTTP.new(uri.host)
    MultiJson.load(http.request_post(uri.path, MultiJson.dump(body)).body).first
  end

  def ip_changed?
    bridge = current_user.bridges.first
    !(bridge.ip == get_local_ip)
  end

  def username_not_valid?
    response = MultiJson.load(Net::HTTP.get(URI.parse("http://#{current_user.bridges.first.ip}/api/#{current_user.username}")))
    
    if response.first['error']
      response.first["error"]["type"] == 1
    else
      false
    end
  end
end
