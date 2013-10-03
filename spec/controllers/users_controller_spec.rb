require 'spec_helper'

describe UsersController do
	context "users#new" do
    let(:user) { create(:user) }
    it 'assigns @user' do
      get :new
      expect(assigns(:user)).to_not be_nil
    end
  end

  context "user#create" do
    describe "invalid attributes" do
      it "does not save" do
        expect { 
          post :create, user: {
                                "first_name"=>"blah",
                                 "last_name"=>"blah",
                                 "email"=>nil,
                                 "password"=>"asdf1234",
                                 "password_confirmation"=>"asdf1234"
                              }
        }.to_not change(User,:count)
      end

      it "redirects to new_user_path" do
        post :create, user: {
                              "first_name"=>"blah",
                               "last_name"=>"blah",
                               "email"=>nil,
                               "password"=>"asdf1234",
                               "password_confirmation"=>"asdf1234"
                            }
        expect{ response }.to render_template('new')
      end
    end

    describe "valid attributes" do
      it "saves user" do
        expect { post :create, user: user_params }.to change(User,:count)
      end

      it "redirects to user_path" do
        post :create, user: user_params
        expect{ response }.to redirect_to User.last
      end
    end
  end

  context 'users#show' do
    before do
      logged_in?
      controller.stub(:current_user).and_return(user)
    end
    describe 'user has no bridge' do
      let(:user) { create(:user) }
      it "should redirect to new_user_bridge" do
        get :show, id: user.id
        expect{ response }.to redirect_to new_user_bridge_path(user) 
      end
    end

    describe 'user has bridge' do
      let(:user) { create(:user, :with_bridge) }
      it "assigns @lamps" do
        get :show, id: user.id
        expect(assigns(:lamps)).to eq user.lamps
      end

      it "assigns @bridge" do
        get :show, id: user.id
        expect(assigns(:bridge)).to eq user.bridge
      end
    end
  end

  context 'users#download' do
    let(:user) { create(:user, :with_bridge) }
    before do
      logged_in?
      controller.stub(:current_user).and_return(user)
      get :download
    end

    it 'assigns @config_yaml' do
      expect(assigns(:config_yaml)).to_not be_nil
    end

    it 'assigns @hue_rb' do
      expect(assigns(:hue_rb)).to_not be_nil
    end

    it 'assigns @gemfile' do
      expect(assigns(:gemfile)).to_not be_nil
    end

    it 'assigns @gemfile_lock' do
      expect(assigns(:gemfile_lock)).to_not be_nil
    end

    it 'assigns @bridge_controller_rb' do
      expect(assigns(:bridge_controller_rb)).to_not be_nil
    end

    it 'assigns @lamp_rb' do
      expect(assigns(:lamp_rb)).to_not be_nil
    end

    it 'assigns @lamp_controller_rb' do
      expect(assigns(:lamp_controller_rb)).to_not be_nil
    end

    it 'assigns @lamp_requests_rb' do
      expect(assigns(:lamp_requests_rb)).to_not be_nil
    end

    it 'assigns @pi_controller_rb' do
      expect(assigns(:pi_controller_rb)).to_not be_nil
    end
  end
end

