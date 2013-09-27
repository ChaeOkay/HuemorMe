class LampsController < ApplicationController

  def create
    bridge = Bridge.find(params[:bridge_id])
    uri = URI.parse("http://#{bridge.ip}/api/1234567890") # stubbed username
    bridge_response = MultiJson.load(Net::HTTP.get(uri))
    bridge_response['lights'].keys.each do |lamp|
      new_lamp = Lamp.new(bridge: bridge, hue_number: lamp)
      unless new_lamp.save
        redirect_to bridge_path(bridge), notice: new_lamp.errors.full_messages
      end
    end
    redirect_to user_path(current_user)
  end

  def update
    @lamp = Lamp.find(params[:id])
    @lamp.turn_on_off
    @lamp.save
    redirect_to users_path, notice: "Lamp is switched #{@lamp.on}"
  end
end