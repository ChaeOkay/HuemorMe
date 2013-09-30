require 'spec_helper'

describe "users/show" do
  let(:bridge) { FactoryGirl.create :bridge, :with_lamps }
  it "displays a lamp" do
    assign(:lamps,
      bridge.user.lamps
    )

    Lamp.any_instance.stub(:toggle_on_off){ "on" }
    Lamp.any_instance.stub(:toggle_colorloop){ "off" }
    Lamp.any_instance.stub(:on?) { false }
    Lamp.any_instance.stub(:colorloop?) { false }

    render
    expect(rendered).to include("Toggle on")
  end
end