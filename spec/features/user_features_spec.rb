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

  # context "turn on light" do
  #   let(:user) { build(:user) }

  #   it "should change off button to on" do
  #     user.stub(:lamps) { [ {"lamp1" => {"status" => { "on" => false }}} ] }

  #     visit users_path
  #     click_button "on"
  #     expect( page.find(:css, '#lamp1').text ).to eq "off"
  #   end
  # end
end
