require 'json'

class ApisController < ApplicationController

  def show
    return { { "192.168.0.152", "1234567890", {"2" => ["toggle_on_off"], "3" =>  ["toggle_on_off"]} }.to_json
  end

end