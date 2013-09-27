require 'spec_helper'

describe LampsController do
  context "POST #create" do
    # let!(:user) { FactoryGirl.create(:user) }
    let!(:bridge) { FactoryGirl.create(:bridge) }

    # before do
    #   controller.stub(:current_user).and_return(user)
    # end

    it "increases lamp count when create new lamp" do
      controller.stub(:bridge).and_return(bridge)
      controller.stub(:bridge_response).and_return({"lights" => {"1" => {}, "2" => {}, "3" => {} }})
      expect { post :create, bridge_id: bridge }.to change { Lamp.all.count }.by(3)
    end
  end
end