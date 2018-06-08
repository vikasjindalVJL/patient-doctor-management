require 'digest/sha1'

class SessionsController < ApplicationController

  skip_before_action :verify_login
  def new
  end

  def create
    encrypted_password = Digest::SHA1.hexdigest(params[:session][:password]) rescue nil
    user = User.where(email: params[:session][:email].downcase, encrypted_password: encrypted_password).first rescue nil
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
    encrypted_password= Digest::SHA1.hexdigest(user_params[:password])
    @user = User.new(username: user_params[:username], encrypted_password: encrypted_password, type: user_params[:type], email: user_params[:email])
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
