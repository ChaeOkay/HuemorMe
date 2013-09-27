require 'spec_helper'

feature 'Login' do
  context 'valid user' do
    let(:user) { create(:user) }
    it "should redirect to user show", :js => true do
      visit root_path
      fill_in "session_email", with: user.email
      fill_in "session_password", with: user.password
      click_button "login"
      page.current_path.should eq user_path(user)
    end
  end
end
