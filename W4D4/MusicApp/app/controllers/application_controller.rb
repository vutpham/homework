class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
    # @current_user.nil? ? nil : @current_user
  end

  def logged_in?
    current_user != nil
  end

  def ensure_user_logged_in
    unless current_user
      flash[:error] = "you must be logged in"
      redirect_to new_user_url
    end
  end

  def log_in_user!(user)
    session[:session_token] = user.session_token
  end
end
