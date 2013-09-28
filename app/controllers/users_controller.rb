class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login @user 
      redirect_to user_path(@user), notice: "Welcome #{@user.first_name}"
    else
      redirect_to new_user_path
    end
  end

  def show
    @lamps = Lamp.all
  end

  private

  def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
