module AuthenticationHelper
	def logged_in?
	  ApplicationController.any_instance.stub(:logged_in?){ true }
	end
end
