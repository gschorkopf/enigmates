class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']
 
    if user = User.find_by_email(auth_hash["info"]["email"])
      notice = "Welcome back, #{user.name}!"
     else
      user = Authorization.find_or_create(auth_hash).user
      notice = "You are now registered as #{user.name}!"
    end

    session[:user_id] = user.id
    redirect_to root_path, notice: notice
  end
  # User.find(session[:user_id]).add_provider(auth_hash)
  # redirect_to root_path, notice: "You can now login using #{auth_hash["provider"].capitalize} too!"
  # Occasionally, auth sources can't find email. Example: Twitter

  def failure
    redirect_to root_path, notice: "Sorry, but you didn't allow access to our app!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out!"
  end
end
