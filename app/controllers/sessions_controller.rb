class SessionsController < ApplicationController
  def new
  end

  def create
    auth_hash = request.env['omniauth.auth']
 
    if session[:user_id]
      User.find(session[:user_id]).add_provider(auth_hash)
   
      redirect_to root_path, notice: "You can now login using #{auth_hash["provider"].capitalize} too!"
    else
      auth = Authorization.find_or_create(auth_hash)
      session[:user_id] = auth.user.id
    
      redirect_to root_path, notice: "Welcome #{auth.user.name}!"
    end
  end

  def failure
    redirect_to root_path, notice: "Sorry, but you didn't allow access to our app!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out!"
  end
end
