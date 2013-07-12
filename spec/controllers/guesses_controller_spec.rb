require 'spec_helper'

describe GuessesController do
  before :each do
    @puzzle = Puzzle.create(
      name: "States in the United States",
      topic: "geography",
      format: "map")
    @piece = @puzzle.pieces.create(content: "alabama")
    @user = User.create(name: "Geoff", email: "geoff@enigmates.com")
    ApplicationController.any_instance.stub(:current_user).and_return(@user)
  end

  describe "POST create" do
    context "mode is co-op" do
      before :each do
        @attempt = @puzzle.attempts.create(mode: "co-op")
        @attempt.add_player(@user.id)
        @partner = User.create(name: "Shane", email: "shane@enigmates.com")
        @attempt.add_player(@partner.id)
      end

      context "guess is incorrect, either player" do
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

      context "guess is correct and piece exists, regardless of which user enters" do
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
          ### Switch to partner as current_user
          ApplicationController.any_instance.stub(:current_user).and_return(@partner)
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

    context "mode is versus" do
      before :each do
        @attempt = @puzzle.attempts.create(mode: "versus")
        @attempt.add_player(@user.id)
        @partner = User.create(name: "Shane", email: "shane@enigmates.com")
        @attempt.add_player(@partner.id)
      end

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

      context "guess is correct and piece exists for user" do
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

      # context "guess is correct and piece exists for other user" do
      #   it "allows creation for another correct guess" do
      #     expect{
      #       post :create,
      #       guess: "alAbama",
      #       attempt_id: @attempt.id,
      #       puzzle_id: @puzzle.id,
      #       format: :js
      #      }.to change(Guess, :count).by(1)
      #     ### Switch to partner as current_user
      #     ApplicationController.any_instance.stub(:current_user).and_return(@partner)
      #     expect{
      #       post :create,
      #       guess: "alabama",
      #       attempt_id: @attempt.id,
      #       puzzle_id: @puzzle.id,
      #       format: :js
      #     }.to change(Guess, :count).by(1)
      #   end
      # end
    end
  end
end