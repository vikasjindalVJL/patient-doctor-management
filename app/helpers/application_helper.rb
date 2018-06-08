module ApplicationHelper
  def load_profile
    redirect_to home_path
  end

  def back_url
    session[:previous_url]
  end
end
