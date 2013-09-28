require 'spec_helper'

describe Lamp do
  context "new" do
    let(:lamp) { build(:lamp) }
    it "should have an on status of false" do
      expect(lamp.on).to eq false
    end

    it "should be able to turn on" do
      pending

      #need to figure out how to
      #stub the http request
      #error occuring in making a connection


      # lamp.turn_on_off
      # expect(lamp.on).to eq true
    end
  end
end
