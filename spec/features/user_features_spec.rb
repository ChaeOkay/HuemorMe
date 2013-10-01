require 'spec_helper'

feature User do

  context "signing up" do
    it "should display a success message" do
      visit root_path
      fill_in "user_first_name", with: "jimmy"
      fill_in "user_last_name", with: "wong"
      fill_in "user_username", with: "jws_lights"
      fill_in "user_email", with: "test@test.com"
      fill_in "user_password", with: "password123"
      fill_in "user_password_confirmation", with: "password123"
      expect{ click_button "sign up" }.to change{ User.count }.by 1
    end
  end

  context "no bridge" do
    let(:user) { FactoryGirl.create(:user) }

    it "should redirect to bridge registration page" do
      visit root_path
      fill_in "session_email", with: user.email
      fill_in "session_password", with: "password123"
      click_button "login"
      expect(page.body).to have_content("Push the button")
    end
  end

context "user dashboard features" do
    let(:bridge) { FactoryGirl.create :bridge }
    let(:lamp) { FactoryGirl.create :lamp, bridge: bridge }
    it "clicking button should flash notice that lamp is on" do
      current_user(bridge.user)
      ip_changed?
      bridge.lamps << lamp

      Lamp.any_instance.stub(:on?) { false }
      Lamp.any_instance.stub(:colorloop?) { false }
      Lamp.any_instance.stub(:say_brightness) { 0 }
      Lamp.any_instance.stub(:toggle_on_off) { false }
      Lamp.any_instance.stub(:toggle_colorloop) { false }

      visit user_path(bridge.user)
      click_button "Toggle on"
      expect(body).to include("Toggle on")
    end
  end
end


