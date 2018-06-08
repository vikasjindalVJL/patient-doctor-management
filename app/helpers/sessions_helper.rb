module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user = @current_user || User.find(session[:user_id]) rescue nil
  end

  def logged_in?
    @current_user = current_user
    !@current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
