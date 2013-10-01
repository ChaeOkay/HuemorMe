class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login @user
      @user.groups.create(name: "All")
      redirect_to user_path(@user), notice: "Welcome #{@user.first_name}"
    else
      render new_user_path
    end
  end

  def show
    if current_user.bridges.empty?
      redirect_to new_user_bridge_path(current_user)
    elsif ip_changed? 
      flash[:notice] = "Your ip has changed, please reconfigure your bridge"
      redirect_to edit_user_bridge_path(current_user, current_user.bridges.first)
    elsif username_not_valid?
      flash[:notice] = "Your username is no longer valid, there appears to have been a hard reset."
      redirect_to edit_user_bridge_path(current_user, current_user.bridges.first)
    else
      @lamps = current_user.lamps
      @bridge = current_user.bridges.first
      @groups = current_user.groups
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password, :password_confirmation)
  end
end
