require 'spec_helper'

describe UsersController do

  describe "GET show" do
    let(:user) { build(:user) }
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