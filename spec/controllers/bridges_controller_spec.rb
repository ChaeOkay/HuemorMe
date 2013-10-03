require 'spec_helper'

describe BridgesController do
  context "bridges#new" do
    let(:user) { create(:user) }
    it "assigns new @bridge" do
      get :new, user_id: user
      expect(assigns(:bridge)).to_not be_nil
    end
  end

  context "bridges#create" do
    describe "invalid attributes" do
      let(:user) { create(:user) }
      before do
        current_user(user)
      end
      it "does not save" do
        expect { post :create, user_id: user.id, bridge: { "ip" => nil, "device_id" => nil, "user_id" => 1} }.to_not change(Bridge,:count)
      end

      it "redirects to new_user_bridge_path" do
        post :create, user_id: user.id, bridge: { "ip" => nil, "device_id" => nil, "user_id" => 1}
        expect { response }.to redirect_to new_user_bridge_path(user)
      end
    end

    describe "valid attributes" do
      let(:user) { create(:user) }
      before do
        current_user(user)
      end

      it "saves bridge" do
        expect { post :create, user_id: user.id, bridge: bridge_params }.to change(Bridge,:count)
      end

      it "redirects to bridge_path" do
        post :create, user_id: user.id, bridge: bridge_params
        expect{ response }.to redirect_to bridge_path(Bridge.last)
      end
    end
  end

  context 'bridges#show' do
    let(:user) { create(:user, :with_bridge) }
    it 'should assign @bridge' do
      get :show, id: user.bridge
      expect(assigns(:bridge)).to eq user.bridge
    end
  end
end