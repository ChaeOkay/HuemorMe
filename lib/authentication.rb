module Authentication
  def login(user)
    session[:user_id] = user.id
  end

  def current_user
    User.find(session[:user_id]) if logged_in?
  end

  def logged_in?
    true if session[:user_id]
  end
end
