module AuthenticationHelper
	def logged_in?(bool)
	  ApplicationController.any_instance.stub(:logged_in?){ bool }
	end

  def current_user(user)
    ApplicationController.any_instance.stub(:current_user){ user }
  end

  def user_params
    UsersController.any_instance.stub(:user_params){ {
                                                       "first_name"=>"blah",
                                                       "last_name"=>"blah",
                                                       "email"=>"blah@blah.com",
                                                       "password"=>"asdf1234",
                                                       "password_confirmation"=>"asdf1234"
                                                      } }
  end

  def bridge_params
    BridgesController.any_instance.stub(:bridge_params){ {
                                                          "ip"=>"000.000.0.000",
                                                          "device_id"=>"12345",
                                                          "user_id"=>"1"
                                                          } }
  end
end
