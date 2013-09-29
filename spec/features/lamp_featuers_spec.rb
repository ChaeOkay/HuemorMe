require 'spec_helper'

feature 'Lamps' do
  context 'when off' do
    let(:bridge) { create(:bridge) }

    it "should show button to turn on" do
      ip_changed?
      current_user bridge.user
      bridge.lamps << Lamp.create(name: "Livingrm", hue_number: "2")
      Lamp.any_instance.stub(:on?){ false }
      visit user_path(bridge.user)
      expect(page.body).to include("Switch on")
    end

  end
end
