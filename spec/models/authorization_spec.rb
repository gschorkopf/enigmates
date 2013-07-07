require 'spec_helper'

describe Authorization do
  describe ".find_or_create" do
    let!(:auth_hash){{"info" =>
      { "name" => "Geoff",
        "email" => "geoff@enigmates.com"},
      "provider" => "twitter",
      "uid" => "123abc"
      }}

    it "creates a user and authorization given no auth exists" do
      auth = Authorization.find_or_create(auth_hash)
      expect(auth.provider).to eq auth_hash["provider"]
      expect(auth.user.name).to eq auth_hash["info"]["name"]
    end
  end
end
