require 'spec_helper'

describe GuessesController do
  before :each do
    @puzzle = Puzzle.create(
      name: "States in the United States",
      topic: "geography",
      format: "map")
    @attempt = @puzzle.attempts.create
    @piece = @puzzle.pieces.create(content: "alabama")
    @user = User.create(name: "Geoff", email: "geoff@enigmates.com")
    @attempt.add_player(@user.id)
    ApplicationController.any_instance.stub(:current_user).and_return(@user)
  end

  describe "POST create" do
    context "guess is incorrect" do
      it "does not create a correct guess" do
        expect{
          post :create,
            guess: "egypt",
            attempt_id: @attempt.id,
            puzzle_id: @puzzle.id,
            format: :js
        }.to change(Guess, :count).by(0)
      end
    end

    context "guess is correct and piece does not exist" do
      it "creates a new, correct guess" do
        expect{
          post :create,
          guess: "alabama",
          attempt_id: @attempt.id,
          puzzle_id: @puzzle.id,
          format: :js
        }.to change(Guess, :count).by(1)
      end
    end

    context "guess is correct and piece exists, regardless of case" do
      it "does not create another correct guess" do
        expect{
          post :create,
          guess: "alAbama",
          attempt_id: @attempt.id,
          puzzle_id: @puzzle.id,
          format: :js
        }.to change(Guess, :count).by(1)
        expect{
          post :create,
          guess: "alabama",
          attempt_id: @attempt.id,
          puzzle_id: @puzzle.id,
          format: :js
        }.to change(Guess, :count).by(0)
      end
    end
  end
end