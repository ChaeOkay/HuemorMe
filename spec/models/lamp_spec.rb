require 'spec_helper'

describe Lamp do
  context "new" do
    let(:lamp) { Lamp.new }
    it "should have an on status of false" do
      expect(lamp.on).to eq false
    end

    it "should be able to turn on" do
      lamp.turn_on_off
      expect(lamp.on).to eq true
    end
  end
end
