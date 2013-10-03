require 'spec_helper'

feature 'Lamps' do
  context 'when off' do
    let(:lamp) { create(:lamp) }

    before do
      current_user lamp.user
      visit bridge_lamp_path(lamp.bridge, lamp)     
    end

    it "should show image to turn on" do
      expect(page.body).to have_selector(".imageblock")
    end

    it "should have button for colorloop" do
      expect(page.body).to have_selector(".colorloop")
    end

    it "should have slider for brightness" do
      expect(page.body).to have_selector(".brightness")
    end
  end
end
