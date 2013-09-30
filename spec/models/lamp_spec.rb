require 'spec_helper'

describe Lamp do

  it { should belong_to :bridge }
  it { should validate_presence_of :hue_number }
  it { should validate_uniqueness_of(:hue_number).scoped_to(:bridge_id).with_message("Cannot register the same light.")}

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
