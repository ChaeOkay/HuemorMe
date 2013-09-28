require 'spec_helper'

feature 'Sessions' do
  context 'valid user login' do
    let(:user) { create(:user) }
    it "should redirect to user show", :js => true do
      visit root_path
      fill_in "session_email", with: user.email
      fill_in "session_password", with: user.password
      click_button "login"
      page.current_path.should eq user_path(user)
    end
  end

  context 'signed in user would be able to click a logout button and be redirected to index' do
    let(:user) { create(:user) }

    it 'should redirect to index page' do
      current_user(user)
      logged_in?
      visit user_path(user)
      click_button('logout')
      page.current_path.should eq root_path
    end
  end

end
