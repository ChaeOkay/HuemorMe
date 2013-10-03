require 'spec_helper'

feature User do

  context "signing up" do
    it "should display a success message" do
      visit root_path
      fill_in "user_first_name", with: "jimmy"
      fill_in "user_last_name", with: "wong"
      fill_in "user_email", with: "test@test.com"
      fill_in "user_password", with: "password123"
      fill_in "user_password_confirmation", with: "password123"
      expect{ click_button "sign up" }.to change{ User.count }.by 1
    end
  end

  context "has no bridge" do
    let(:user) { create(:user) }

    it "should redirect to bridge registration page" do
      visit root_path
      fill_in "session_email", with: user.email
      fill_in "session_password", with: "password123"
      click_button "login"
      expect(page.body).to have_content("Please press the link button")
    end
  end

  context "has a bridge but no lamps" do
    let(:user) { create(:user) }
    it "should redirect to add lamps page"
  end

  context "user show" do
    let(:lamp) { create(:lamp) }
    before do
      visit root_path
      fill_in "session_email", with: lamp.user.email
      fill_in "session_password", with: "password123"
      click_button "login"
    end

    it "clicking button should flash notice that lamp is on" do
      expect(body).to have_link('Lamp 1')
    end

    it 'clicking lamp 1 should redirect to lamp show' do
      click_link 'Lamp 1'
      expect(body).to have_content('Lamp 1')
    end
  end
end


