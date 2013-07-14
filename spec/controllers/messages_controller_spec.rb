require 'spec_helper'

describe MessagesController do
  before :each do
    @user = User.create(name: "Geoff", email: "geoff@enigmates.com")
    ApplicationController.any_instance.stub(:current_user).and_return(@user)
    @receiver = User.create(name: "Shane", email: "shane@enigmates.com")
  end

  describe "POST create" do
    it "creates a new message object" do
      expect {  
        post :create,
        content: "Hello, Shane.",
        receiver_id: @receiver.id,
        format: :js
      }.to change(@receiver.messages, :count).by(1)
    end
  end

end