require 'spec_helper'

feature 'Login' do

  context 'valid user' do
    let(:user) { build(:user) }

    it "should redirect to user show" do
      visit root_path
      fill_in "user_email", with: user.email
      fill_in "user_password", with: user.password
      click_button "sign up"
      page.current_path.should eq user_path(user)
    end
  end

end
