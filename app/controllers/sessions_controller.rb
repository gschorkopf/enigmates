class SessionsController < ApplicationController
  def new
  end

  def create
    auth_hash = request.env['omniauth.auth']
 
    @authorization = Authorization.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
    
    if @authorization
      redirect_to root_path, notice: "Welcome back #{@authorization.user.name}! You have already signed up."
    else
      user = User.new(
        name: auth_hash["info"]["name"],
        email: auth_hash["info"]["email"])
      user.authorizations.build(
        provider: auth_hash["provider"],
        uid: auth_hash["uid"])
      user.save   
      redirect_to root_path, notice: "Welcome #{user.name}! Good luck on your puzzlin'."
    end
  end

  def failure
  end
end
