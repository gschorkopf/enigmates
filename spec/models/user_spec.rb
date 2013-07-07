require 'spec_helper'

describe User do
  before :each do
    @user = User.create(name: "Geoff", email: "geoff@enigmates.com")
  end

  describe "#to_s" do
    it "overwrites string for user" do
      expect(@user.to_s).to eq @user.name
    end
  end
end
