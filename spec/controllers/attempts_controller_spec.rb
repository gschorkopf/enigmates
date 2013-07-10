require 'spec_helper'

describe AttemptsController do
  let(:valid_session) { {} }

  before :each do
    @puzzle = Puzzle.create(
      name: "States in the United States",
      topic: "geography",
      format: "map")
    @user = User.create(name: "Geoff", email: "geoff@enigmates.com")
    ApplicationController.any_instance.stub(:current_user).and_return(@user)
  end

  describe "GET show" do
    context "user is a player for attempt" do
      it "get request should be success" do
        attempt = @puzzle.attempts.create!
        attempt.add_player(@user.id)
        get :show, {id: attempt.to_param, puzzle_id: @puzzle.to_param}, valid_session
        expect(response.status).to eq 200
      end
    end

    context "user is not a player for attempt" do
      it "get request should redirect to puzzles path" do
        attempt = @puzzle.attempts.create!
        get :show, {id: attempt.to_param, puzzle_id: @puzzle.to_param}, valid_session
        response.should redirect_to(puzzles_path)
      end
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Attempt with current user" do
        expect {
          post :create, {puzzle_id: @puzzle.id}, valid_session
        }.to change(Attempt, :count).by(1)
        expect(Attempt.last.users).to eq [@user]
      end
    end
  end
end