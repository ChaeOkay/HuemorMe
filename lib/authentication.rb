module Authentication
  def login(user)
    session[:user_id] = user.id
  end

  def current_user
    User.find(session[:user_id]) if logged_in?
  end

  def logged_in?
    session[:user_id]
  end

  def log_out
  	session.destroy
  end

end
