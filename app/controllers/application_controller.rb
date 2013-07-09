class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user
  end

  def require_login
    unless logged_in?
      redirect_to "/login", notice: "You must be logged in to puzzle it up!"
    end
  end
end
