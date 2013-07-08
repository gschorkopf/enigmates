require 'spec_helper'

describe User do
  before :each do
    @user = User.create(name: "Geoff", email: "geoff@enigmates.com")
    @auth_hash =
      {"provider" => "facebook",
       "uid" => "1234"}
  end

  describe "#add_provider" do
    context "given user is not authorized for provider" do
      it "adds a new provider" do
        expect(@user.authorizations.count).to eq 0
        @user.add_provider(@auth_hash)
        expect(@user.authorizations.count).to eq 1
      end
    end
  end

  describe "#to_s" do
    it "overwrites string for user" do
      expect(@user.to_s).to eq @user.name
    end
  end
end
