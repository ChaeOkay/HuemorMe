module AuthenticationHelper
	def logged_in?
	  ApplicationController.any_instance.stub(:logged_in?){ true }
	end

  def current_user(user)
    ApplicationController.any_instance.stub(:current_user){ user }
  end
end
