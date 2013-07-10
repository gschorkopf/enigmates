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
      redirect_to "/login"
    end
  end

  def require_player
    attempt = find_attempt
    unless current_user.attempts.include?(attempt)
      redirect_to puzzles_path
    end
  end

private
  def find_attempt
    Attempt.find(params[:id] || params[:attempt_id])
  end
end
