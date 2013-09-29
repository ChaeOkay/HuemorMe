module RegisterLamps

  def get_lights(bridge)
    uri = URI.parse("http://#{bridge.ip}/api/#{current_user.username}")
    MultiJson.load(Net::HTTP.get(uri))
  end
end

