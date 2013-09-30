require 'spec_helper'

describe Lamp do

  it { should belong_to :bridge }
  it { should validate_presence_of :hue_number }

  let(:lamp) { build(:lamp) }
  context "new" do
    it "should have an on status of false" do
      expect(lamp.on).to eq false
    end
  end

  context "#send_command" do
    let(:response) {
      {
        'on' => true,
        'effect' => 'colorloop',
        'bri' => '77'
      }
    }

    context "#say_on_off?" do
      it "returns off" do
        stub_state
        expect(lamp.say_on_off).to eq "off"
      end
      it "returns on" do
        stub_state({'on' => false})
        expect(lamp.say_on_off).to eq "on"
      end
    end

    context "#say_colorloop" do
      it "returns off" do
        stub_state
        expect(lamp.say_colorloop).to eq 'off'
      end
      it "returns on" do
        stub_state({'effect' => 'none'})
        expect(lamp.say_colorloop).to eq 'on'
      end
    end

    context "#say_brightness" do
      it "returns 77%" do
        stub_state
        expect(lamp.say_brightness).to eq '77%'
      end
    end
  end

  def stub_state(options = {})
    response.merge! options
    lamp.stub(:state) { response }
  end
end
