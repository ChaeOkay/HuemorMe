require 'spec_helper'

describe Lamp do

  it { should belong_to :bridge }
  it { should have_one :user }
  it { should validate_presence_of :light_identifier }
  it { should validate_uniqueness_of(:light_identifier).scoped_to(:bridge_id).with_message("Cannot register the same light.")}

  let(:lamp) { build(:lamp) }
  context "new" do
    it "should have an on status of false" do
      expect(lamp.on).to eq false
    end
  end

  context "#send_command" do
    it "should return off when calling say_on_off" do
      lamp.send_command("say_on_off") == "off"
    end
  end
end
