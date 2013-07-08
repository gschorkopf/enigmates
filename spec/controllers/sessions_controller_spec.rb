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
      it "creates a new authorization and user" do
        expect(User.all).to eq []
        get :create, provider: "facebook"
        user = User.last
        expect(user.name).to eq "Geoff"
        expect(user.authorizations.first.provider).to eq "facebook"
      end
    end

    context "user with given email is in DB" do
      let!(:user){User.create(name: "Geoff", email: "geoff@enigmates.com")}

      it "creates a new authorization for user" do
        expect(user.authorizations).to eq []
        get :create, provider: "facebook"
        updated_user = User.find(user.id)
        expect(updated_user.authorizations.count).to eq 1
        expect(updated_user.authorizations.first.provider).to eq "facebook"
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
      expect(session[:user_id]).to eq 1
      get :destroy
      expect(session[:user_id]).to eq nil
    end
  end
end
