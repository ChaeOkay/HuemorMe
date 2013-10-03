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

    context "#turn_on" do
      it "returns true" do
        lamp.turn_on
        expect(lamp.on).to be_true
      end
    end

    context "#turn_off" do
      it "returns false" do
        lamp.turn_off
        expect(lamp.on).to be_false
      end
    end

    context "#set_color" do
      it "returns color" do
        args = { color: '10000' }
        lamp.set_color(args)
        expect(lamp.color).to eq '10000'
      end
    end

    context '#set_color_and_sat' do
      it 'changes color, saturation, brightness' do
        args = { color: '10000', saturation: '100', brightness: '100' }
        lamp.set_color_and_sat(args)
        expect(lamp.color).to eq '10000'
        expect(lamp.saturation).to eq '100'
        expect(lamp.brightness).to eq '100'
      end
    end

    context "#set_brightness" do
      it "returns 50" do
        args = { brightness: '50' }
        lamp.set_brightness(args)
        expect(lamp.brightness).to eq '50'
      end
    end

    context '#turn_colorloop_on' do
      it 'returns colorloop' do
        lamp.turn_colorloop_on
        expect(lamp.effect).to eq 'colorloop'
      end
    end

    context '#turn_colorloop_off' do
      it 'returns non' do
        lamp.turn_colorloop_off
        expect(lamp.effect).to eq 'none'
      end
    end
  end
end
