require 'spec_helper'

describe Authorization do
  describe ".create_from_auth" do
    let!(:auth_hash){{"info" =>
      { "name" => "Geoff",
        "email" => "geoff@enigmates.com"},
      "provider" => "twitter",
      "uid" => "123abc"
      }}

    it "creates a user and authorization given no user exists" do
      auth = Authorization.create_from_auth(auth_hash)
      expect(auth.provider).to eq auth_hash["provider"]
      expect(auth.user.name).to eq auth_hash["info"]["name"]
    end
  end
end
