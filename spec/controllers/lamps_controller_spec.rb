require 'spec_helper'

describe LampsController do
  context "lamps#create" do
    describe 'invalid attributes' do
      let(:user) { create(:user, :with_bridge) }

      it "creates a flash[:lamp] notice" do
        post :create, bridge_id: user.bridge.id, lamp_ids: "0,0"
        expect{response}.to redirect_to setup_path
      end
    end

    describe "valid attributes" do
      let(:user) { create(:user, :with_bridge) }

      it "creates a lamp" do
        expect{ post :create, bridge_id: user.bridge.id, lamp_ids: "1,2" }.to change(Lamp,:count) 
      end
    end
  end

  context 'lamps#settings' do
    let(:bridge) { create(:bridge, :with_lamps) }

    it 'assigns @lamp' do
      get :settings, bridge_id: bridge.id, id: bridge.lamps.first.id, lamp:{ "command"=>"turn_on" }
      expect(:lamp).to_not be_nil
    end

    it 'sends turn_on' do
      get :settings, bridge_id: bridge.id, id: bridge.lamps.first.id, lamp:{ "command"=>"turn_on" }
      expect{ @lamp.on }.to be_true
    end
  end

  context 'lamps#show' do
    let(:bridge) { create(:bridge, :with_lamps) }
    it 'assigns @lamp' do
      get :show, bridge_id: bridge.id, id: bridge.lamps.first.id
      expect(:lamp).to_not be_nil
    end
  end
end
