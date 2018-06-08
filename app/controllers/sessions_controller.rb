class SessionsController < ApplicationController

  skip_before_action :verify_login
  def new
  end

  def create
    user = User.where(email: params[:session][:email].downcase, password: params[:session][:password]).first rescue nil
    if user
      log_in user
      redirect_to user
    else
      @error_msg = "Invalid username or password"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end

  def signup
    @user = User.new
    render 'sessions/signup'
  end

  def new_user
    @user = User.new(user_params)
    begin
      if @user.save!
        session[:user_id] = @user.id
        logged_in?
        redirect_to '/login'
      end
    rescue
      render 'signup'
    end
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :type)
  end
end
