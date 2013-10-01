require 'spec_helper'

feature 'Lamps' do
  context 'when off' do
    let(:bridge) { create(:bridge) }

    it "should show button to turn on" do
      ip_changed?
      username_not_valid?
      current_user bridge.user
      bridge.lamps << Lamp.create(name: "Livingrm", hue_number: "2")
      Lamp.any_instance.stub(:on?){ false }
      Lamp.any_instance.stub(:colorloop?){ false }
      Lamp.any_instance.stub(:say_brightness) { 0 }
      visit user_path(bridge.user)
      expect(page.body).to include("Toggle on?")
    end

  end
end
