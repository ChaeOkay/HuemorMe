class SessionsController < ApplicationController
  def create
    @user = User.find_by_email(params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      login @user
      redirect_to @user, notice: "Welcome #{@user.first_name}"
    else
      redirect_to new_user_path, notice: "Invalid email/password combination"
    end
  end

  def destroy
  	reset_session
    redirect_to root_path
  end
end
