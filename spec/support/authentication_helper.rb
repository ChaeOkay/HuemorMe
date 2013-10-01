module AuthenticationHelper
	def logged_in?
	  ApplicationController.any_instance.stub(:logged_in?){ true }
	end

  def current_user(user)
    ApplicationController.any_instance.stub(:current_user){ user }
  end

  def ip_changed?
  	ApplicationController.any_instance.stub(:ip_changed?){ false }
  end

  def username_not_valid?
    ApplicationController.any_instance.stub(:username_not_valid?){ false }
  end
end
