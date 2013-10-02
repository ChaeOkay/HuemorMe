require 'spec_helper'

class MyLamp
  include LampRequests
end

describe "LampRequests" do
  let(:lamp) { create(:lamp) }
  context "#send_command" do

    context "#say_on_off?" do
      it "returns off" do
        expect(lamp.say_on_off).to eq "on"
      end
      it "returns on" do
        lamp.on = true
        expect(lamp.say_on_off).to eq "off"
      end
    end

    context "#say_colorloop" do
      it "returns off" do
        expect(lamp.say_colorloop).to eq 'off'
      end
      it "returns on" do
        lamp.effect = 'none'
        expect(lamp.say_colorloop).to eq 'on'
      end
    end

    context "#say_brightness" do
      it "returns 30" do
        expect(lamp.say_brightness).to eq '30'
      end
    end
  end
end
