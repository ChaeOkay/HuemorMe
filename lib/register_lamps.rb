module RegisterLamps

  def get_lights(bridge)
    uri = URI.parse("http://#{bridge.ip}/api/1234567890") # stubbed username
    MultiJson.load(Net::HTTP.get(uri))
  end

end