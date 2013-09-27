class LampsController < ApplicationController
  def update
    @lamp = Lamp.find(params[:id])
    @lamp.turn_on_off
    @lamp.save
    redirect_to users_path, notice: "Lamp is switched #{@lamp.on}"
  end
end
