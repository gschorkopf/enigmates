require 'spec_helper'

describe Attempt do
  before :each do
    @puzzle = Puzzle.create(
      name: "States in the United States",
      topic: "geography",
      format: "map")
    @attempt = @puzzle.attempts.create
    @piece = @puzzle.pieces.create(content: "alabama")
    @user = User.create(name: "Geoff", email: "geoff@enigmates.com")
  end
  
  describe "#piece_exists?" do
    it "returns true if correct guess exists for piece" do
      @attempt.guesses.create(piece_id: @piece.id)
      expect(@attempt.piece_exists?(@piece.id)).to eq true
    end

    it "returns false if no correct guess exists for piece" do
      expect(@attempt.piece_exists?(42)).to eq false
    end
  end
  
  describe "#add_player" do
    it "adds a new attempt users to attempt" do
      @attempt.add_player(@user.id)
      expect(@attempt.users).to eq [@user]
    end
  end
end
