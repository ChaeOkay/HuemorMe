require 'spec_helper'

describe BridgesController do
  context "GET #new" do
    let(:user) { create(:user) }
    it "assigns new @bridge" do
      get :new, user_id: user
      expect(assigns(:bridge)).to_not be_nil
    end
  end

  context "POST #create" do
    let(:user) { create(:user) }

    before do
      controller.stub(:get_local_ip).and_return("000.000.0.000")
      controller.stub(:current_user).and_return(user)
    end

    it "invalid info redirects to new_user_bridge" do
      #No error handling in place
      controller.stub(:register_user).and_return({'error' => "stubbed error message"})
      post :create, user_id: user
      expect { response }.to redirect_to new_user_bridge_path(user)
      end

    it "valid info saves new bridge" do
      controller.stub(:register_user).and_return({})
      expect { post :create, user_id: user }.to change{ Bridge.all.count }.by(1)
    end
  end
end
