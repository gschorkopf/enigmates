require 'spec_helper'

describe SessionsController, "OmniAuth" do
  describe "POST create" do
    before do
      request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
    end

    it "sets a session variable to the auth hash" do
      request.env["omniauth.auth"][:uid].should == '1234'
    end

    context "user with given email is not in DB" do
      xit "creates a new authorization and user" do
        post :create
        expect(User.last.name).to eq "Geoff"
      end
    end
  end

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
