require 'spec_helper'

describe SessionsController do
  describe "POST create"

  describe "GET failure" do
    it "redirects to root path" do
      get :failure
      response.should redirect_to(root_path)
    end
  end

  describe "GET destroy" do
    it "should clear session for user_id" do
      session[:user_id] = 1
      get :destroy
      expect(session[:user_id]).to eq nil
    end
  end
end
