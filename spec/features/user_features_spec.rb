require 'spec_helper'

feature User do

  context "signing up" do
    it "should display a success message" do
      visit root_path
      fill_in "user_first_name", with: "jimmy"
      fill_in "user_last_name", with: "wong"
      fill_in "user_username", with: "jws_lights"
      fill_in "user_email", with: "test@test.com"
      fill_in "user_password", with: "password"
      fill_in "user_password_confirmation", with: "password"
      click_button "sign up"
      expect(page).to have_content("Welcome")
    end
  end

  context "user dashboard features" do
    let(:bridge) { FactoryGirl.create :bridge }
    let(:lamp) { FactoryGirl.create :lamp, bridge: bridge }
    it "clicking button should flash notice that lamp is on" do
      current_user(bridge.user)
      bridge.lamps << lamp

      Lamp.any_instance.stub(:on?) { false }
      Lamp.any_instance.stub(:colorloop?) { false }

      # The stub value is inconsequential, just cancelling the HTTP request
      Lamp.any_instance.stub(:toggle_on_off) { false } 
      Lamp.any_instance.stub(:toggle_colorloop) { false }     

      visit user_path(bridge.user)
      # binding.pry
      click_button "Toggle on"
      expect(body).to include("Toggle on")
    end
  end
end

 