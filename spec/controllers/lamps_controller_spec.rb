require 'spec_helper'

describe LampsController do
  context "lamps#create" do
    describe 'invalid attributes' do
      let(:user) { create(:user, :with_bridge) }

      it "does not save lamps that have the same identifier" do
        expect{ post :create, bridge_id: user.bridge.id, lamp_ids: "0,0" }.to change(Lamp,:count).by 1
      end

      it "does not save lamps that are not connected to the bridge" do
        expect{ post :create, bridge_id: user.bridge.id, lamp_ids: "" }.to_not change(Lamp,:count)
      end

      it "expects flash message when no lamps are connected" do
        post :create, bridge_id: user.bridge.id, lamp_ids: ""
        expect(flash[:lamp].first).to eq "No lights connected to bridge."
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
