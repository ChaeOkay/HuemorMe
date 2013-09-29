module RegisterLamps

  def get_lights(bridge)
    uri = URI.parse("http://#{bridge.ip}/api/#{current_user.username}")
    response = MultiJson.load(Net::HTTP.get(uri))
    response['lights'].keys
  end

end
