require 'spec_helper'

describe BridgesController do
  context "GET #new" do
    it "assigns new @bridge" do
      get :new
      expect(assigns(:bridge)).to_not be_nil
    end
  end

  context "POST #create" do
    let!(:user) { FactoryGirl.create(:user) }
    
    before do
      controller.stub(:get_local_ip).and_return("192.168.0.152")
      controller.stub(:current_user).and_return(user)
    end

    it "invalid info redirects to new_user_bridge" do 
      controller.stub(:register_user).and_return({'error' => "blah"})
      post :create
      expect { response }.to redirect_to new_user_bridge_path(user)
      end

    it "valid info saves new bridge" do
      controller.stub(:register_user).and_return({})
      expect { post :create }.to change{ Bridge.all.count }.by(1)
    end
  end
end