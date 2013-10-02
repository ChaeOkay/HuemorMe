require 'json'

class ApisController < ApplicationController

  def show
    data = [ "192.168.0.152", "1234567890", {"2" => ["toggle_on_off"], "3" => ["toggle_on_off"] }]
    render json: data
  end

end