require 'spec_helper'

describe Attempt do
  describe "#piece_exists?" do
    before :each do
      @puzzle = Puzzle.create(
        name: "States in the United States",
        topic: "geography",
        format: "map")
      @attempt = @puzzle.attempts.create
      @piece = @puzzle.pieces.create(content: "alabama")
    end

    it "returns true if correct guess exists for piece" do
      @attempt.guesses.create(piece_id: @piece.id)
      expect(@attempt.piece_exists?(@piece.id)).to eq true
    end

    it "returns false if no correct guess exists for piece" do
      expect(@attempt.piece_exists?(42)).to eq false
    end
  end
  
end
