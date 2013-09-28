require 'spec_helper'

describe LampsController do
  context "POST #create" do
    let!(:bridge) { FactoryGirl.create(:bridge) }

    before do
      controller.stub(:bridge).and_return(bridge)
    end

    it "increases lamp count when create new lamp" do
      controller.stub(:get_lights).and_return({"lights" => {"1" => {}, "2" => {}, "3" => {} }})
      expect { post :create, bridge_id: bridge }.to change { Lamp.all.count }.by(3)
    end

    it "redirects to bridge show with invalid lamp info" do
      controller.stub(:get_lights).and_return({"lights" => {nil => {}}})
      
      post :create, bridge_id: bridge
      expect { response }.to redirect_to bridge_path(bridge)
    end
  end
end