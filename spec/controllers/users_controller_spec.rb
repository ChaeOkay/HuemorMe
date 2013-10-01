require 'spec_helper'

describe UsersController do
	context "GET #show" do
    let!(:user) { FactoryGirl.create(:user, :with_bridges) }

    before do
      controller.stub(:current_user).and_return(user)
    end

    it "should redirect to bridge edit page when ip has changed" do
      controller.stub(:get_local_ip).and_return("123.123.0.123")
      controller.stub(:username_not_valid?).and_return(false)

      get :show, id: user.id
      expect{ response }.to redirect_to edit_user_bridge_path(user, user.bridges.first)
    end

    it "should redirect to bridge edit when username is not valid" do
      controller.stub(:get_local_ip).and_return("000.000.0.000")
      controller.stub(:username_not_valid?).and_return(true)

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
      controller.stub(:username_not_valid?).and_return(false)
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
