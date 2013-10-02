class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login @user
      redirect_to user_path(@user), notice: "Welcome #{@user.first_name}"
    else
      render new_user_path
    end
  end

  def show
    if current_user.bridge == nil
      redirect_to new_user_bridge_path(current_user)
    # elsif ip_changed?
    #   redirect_to edit_user_bridge_path(current_user, current_user.bridge)
    else
      @lamps = current_user.lamps
      @bridge = current_user.bridge
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def signed_in_user
    redirect_to new_user_path unless logged_in?
  end
end
