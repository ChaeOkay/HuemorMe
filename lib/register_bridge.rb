module RegisterBridge

  def get_local_ip 
    meethue = 'http://www.meethue.com/api/nupnp'
    meethue_json = MultiJson.load(Net::HTTP.get(URI.parse(meethue)))
    meethue_json.first["internalipaddress"]
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


end