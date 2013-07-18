class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :logged_in?, :all_users, :clean_entry

  def all_users
    @all_users ||= User.all.reject{|u| u == current_user}.map(&:name)
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user
  end

  def clean_entry(guess)
    guess.downcase.gsub("'", "").rstrip
  end

  def require_login
    unless logged_in?
      redirect_to "/login"
    end
  end

  def require_player
    attempt = find_attempt
    unless attempt.has_player?(current_user.id)
      redirect_to puzzles_path
    end
  end

private
  def find_attempt
    Attempt.find(params[:attempt_id] || params[:id])
  end
end
