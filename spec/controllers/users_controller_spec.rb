require 'spec_helper'

describe UsersController do 
	 context "GET #show" do
    let!(:user) { FactoryGirl.create(:user, :with_bridges) }

    it "should redirect to bridge edit page" do
      controller.stub(:get_local_ip).and_return("123.123.0.123")
      controller.stub(:current_user).and_return(user)

      get :show, id: user.id
      expect{ response }.to redirect_to edit_user_bridge_path(user, user.bridges.first)
    end
  end
end