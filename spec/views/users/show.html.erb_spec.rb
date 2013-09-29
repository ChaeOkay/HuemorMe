require 'spec_helper'

describe "users/show" do
  let(:bridge) { FactoryGirl.create :bridge, :with_lamps }
  it "displays all lamps belonging to user" do
    assign(:lamps,
      bridge.user.lamps
    )

    Lamp.any_instance.stub(:say_on_off){ "on" }

    render
    expect(rendered).to include("kitchen")
  end
end
