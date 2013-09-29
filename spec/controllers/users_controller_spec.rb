require 'spec_helper'

describe UsersController do

  describe "GET show" do
    let(:user) { build(:user) }

    before do
      controller.stub(:current_user).and_return(user)
      controller.stub(:bridge).and_return( Bridge.new(user: user))
      controller.stub(:lamps).and_return(Lamp.new)
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