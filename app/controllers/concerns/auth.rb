module Auth

  def force_login user
    session[:user] = user.id
  end

  def login credentials
    if user = User.find_by_login(credentials[:login])&.authenticate(credentials[:password])
      session[:user] = user.id
    end
    user
  end

  def logout
    session[:user] = nil
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user])
  end

  def current_admin
    @current_admin ||= User.admins.find_by(id: session[:user])
  end
end
