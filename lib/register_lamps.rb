module RegisterLamps

  def get_lights(bridge)
    uri = URI.parse("http://#{bridge.ip}/api/#{current_user.username}")
    binding.pry
    MultiJson.load(Net::HTTP.get(uri))['lights'].keys
  end

end
