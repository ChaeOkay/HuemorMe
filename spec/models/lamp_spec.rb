require 'spec_helper'

describe Lamp do

  it { should belong_to :bridge }
  it { should belong_to :group }
  it { should validate_presence_of :hue_number }

  let(:lamp) { build(:lamp) }
  context "new" do
    it "should have an on status of false" do
      expect(lamp.on).to eq false
    end
  end
end
