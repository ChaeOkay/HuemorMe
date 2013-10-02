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

  def setup
  end

  def download
    @config_yaml = "---\nIP: 192.168.0.152\nEMAIL: me@me.com"
    @hue_rb = Net::HTTP.get_response(URI.parse('https://raw.github.com/jimwong1023/deamonsinsideme/user_download/hue.rb')).body
    @gemfile = Net::HTTP.get_response(URI.parse('https://raw.github.com/jimwong1023/deamonsinsideme/user_download/Gemfile')).body
    @gemfile_lock = Net::HTTP.get_response(URI.parse('https://raw.github.com/jimwong1023/deamonsinsideme/user_download/Gemfile.lock')).body
    @bridge_controller_rb = Net::HTTP.get_response(URI.parse('https://raw.github.com/jimwong1023/deamonsinsideme/user_download/lib/bridge_controller.rb')).body
    @lamp_rb = Net::HTTP.get_response(URI.parse('https://raw.github.com/jimwong1023/deamonsinsideme/user_download/lib/lamp.rb')).body
    @lamp_controller_rb = Net::HTTP.get_response(URI.parse('https://raw.github.com/jimwong1023/deamonsinsideme/user_download/lib/lamp_controller.rb')).body
    @lamp_requests_rb = Net::HTTP.get_response(URI.parse('https://raw.github.com/jimwong1023/deamonsinsideme/user_download/lib/lamp_requests.rb')).body
    @pi_controller_rb = Net::HTTP.get_response(URI.parse('https://raw.github.com/jimwong1023/deamonsinsideme/user_download/lib/pi_controller.rb')).body
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password, :password_confirmation)
  end

  def signed_in_user
    redirect_to new_user_path unless logged_in?
  end
end
