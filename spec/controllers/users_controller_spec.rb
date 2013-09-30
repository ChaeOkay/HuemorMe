require 'spec_helper'

describe UsersController do
	context "GET #show" do
    let!(:user) { FactoryGirl.create(:user, :with_bridges) }

    it "should redirect to bridge edit page" do
      controller.stub(:get_local_ip).and_return("123.123.0.123")
      controller.stub(:current_user).and_return(user)

      get :show, id: user.id
      expect{ response }.to redirect_to edit_user_bridge_path(user, user.bridges.first)
    end
  end

  context "GET #show with valid bridge" do
    let!(:user) { FactoryGirl.create(:user, :with_bridges) }

    before do
      controller.stub(:current_user).and_return(user)
      controller.stub(:lamps).and_return(Lamp.new)
      controller.stub(:ip_changed?).and_return(false)
    end

    it "successfully finds show route" do
      get :show, :id => 1
      expect(response).to be_success
    end

    it "renders the show template" do
      get :show, :id => 1
      expect(response).to render_template("show")
    end
  end
end
