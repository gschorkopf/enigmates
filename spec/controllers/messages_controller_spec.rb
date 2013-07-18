require 'spec_helper'

describe MessagesController do
  before :each do
    @puzzle = Puzzle.create(
      name: "States in the United States",
      topic: "geography",
      format: "map")
    @attempt = @puzzle.attempts.create
    @user = User.create(name: "Geoff", email: "geoff@enigmates.com")
    ApplicationController.any_instance.stub(:current_user).and_return(@user)
    @receiver = User.create(name: "Shane", email: "shane@enigmates.com")
  end

  describe "POST create" do
    it "creates a new entering message" do
      post :create,
        message: "enter",
        attempt_id: @attempt.id,
        puzzle_id: @puzzle.id,
        format: :js
      expect(response.status).to eq 200
    end

    it "creates a new exiting object" do
      post :create,
        message: "exit",
        attempt_id: @attempt.id,
        puzzle_id: @puzzle.id,
        format: :js
      expect(response.status).to eq 200
    end
  end

end