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

  context "GET #edit" do
    let(:user) { create(:user, :with_bridges) }
    it "assigns @bridge" do
      controller.stub(:current_user).and_return(user)
      get :edit, user_id: user.id, id: user.bridges.first.id
      expect(assigns(:bridge)).to_not be_nil
    end
  end

  context "PATCH #update" do
    let(:user) { create(:user, :with_bridges) }

    before do
      controller.stub(:get_local_ip).and_return("123.123.0.123")
      controller.stub(:current_user).and_return(user)
    end

    it "invalid/errors redirects to edit_user_bridge" do
      controller.stub(:register_user).and_return({'error' => "stubbed error message"})

      patch :update, user_id: user.id, id: user.bridges.first.id
      expect { response }.to redirect_to edit_user_bridge_path(user, user.bridges.first)
    end

    it "should redirect to current user path" do
      controller.stub(:register_user).and_return({})
      patch :update, user_id: user.id, id: user.bridges.first.id
      expect { response }.to redirect_to user_path(user)
    end
  end
end