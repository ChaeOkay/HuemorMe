require 'spec_helper'

describe LampsController do
  context "POST #create" do
    let!(:bridge) { create(:bridge) }

    before do
      controller.stub(:bridge).and_return(bridge)
    end

    it "increases lamp count when create new lamp" do
      controller.stub(:get_lights).and_return(["1", "2", "3"])
      expect { post :create, bridge_id: bridge }.to change { Lamp.all.count }.by(3)
    end

    it "redirects to bridge show with invalid lamp info" do
      controller.stub(:get_lights).and_return([])
      expect { post :create, bridge_id: bridge }.not_to change{ Lamp.all.count }
    end
  end

  context 'POST #update' do
    let(:lamp) { create(:lamp) }
    it "should send command" do
      #pending - send command requires net/http request

      # lamp.send_command("turn_on_off")
      # expect( lamp.on? ).to eq true
    end
  end

end
