require 'spec_helper'

describe LampsController do
  context "POST #create" do
    let(:user) { create(:user, :with_bridges, :with_groups)}

    before do
      current_user(user)
    end

    it "increases lamp count when create new lamp" do
      controller.stub(:get_lights).and_return(["1", "2", "3"])
      expect { post :create, bridge_id: user.bridges.first }.to change { Lamp.all.count }.by(3)
    end

    it "redirects to bridge show with invalid lamp info" do
      controller.stub(:get_lights).and_return([])
      expect { post :create, bridge_id: user.bridges.first }.not_to change{ Lamp.all.count }
    end
  end
end
