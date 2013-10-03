require 'spec_helper'

describe SessionsController do
  context 'sessions#create' do
    let!(:user) { create(:user) }
    describe 'valid  user' do
      it 'redirects to user_path' do
        post :create, session: { email: 'test@test.com', password: 'password123' }
        expect{ response }.to redirect_to user_path(user)
      end
    end

    describe 'invalid user' do
      it 'redirects to new_user_path' do
        post :create, session: { email: 'test@test.com', password: 'pass' }
        expect{ response }.to redirect_to new_user_path
      end
    end
  end

  context 'sessions#destroy' do
    let!(:user) { create(:user) }
    describe 'logged in user' do
      it 'redirects to root_path' do
        delete :destroy, session: { user_id: 1 }
        expect { respone }.to redirect_to root_path
      end
    end
  end
end