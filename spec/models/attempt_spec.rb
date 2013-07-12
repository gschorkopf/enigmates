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
    @partner = User.create(name: "Shane", email: "shane@enigmates.com")
  end
  
  describe "#piece_solved?" do
    it "returns true if correct guess solved for piece" do
      @attempt.guesses.create(piece_id: @piece.id)
      expect(@attempt.piece_solved?(@piece.id)).to eq true
    end

    it "returns false if no correct guess solved for piece" do
      expect(@attempt.piece_solved?(42)).to eq false
    end
  end

  describe "#piece_solved_by_player?" do
    it "returns true if specific player has solved piece" do
      @attempt.guesses.create(piece_id: @piece.id, user_id: @user.id)
      expect(@attempt.piece_solved_by_player?(@piece.id, @user.id)).to eq true
    end

    it "returns false if no one has solved piece" do
      expect(@attempt.piece_solved_by_player?(42, @user.id)).to eq false
    end

    it "returns false if another player has solved piece" do
      @attempt.guesses.create(piece_id: @piece.id, user_id: @user.id)
      expect(@attempt.piece_solved_by_player?(@piece.id, @partner.id)).to eq false
    end
  end
  
  describe "#add_player" do
    it "adds a new attempt users to attempt" do
      @attempt.add_player(@user.id)
      expect(@attempt.users).to eq [@user]
    end
  end

  describe "#has_player?" do
    it "returns true if user is assoc with attempt" do
      @attempt.add_player(@user.id)
      expect(@attempt.has_player?(@user.id)).to eq true
    end

    it "returns false if user is not part of attempt" do
      expect(@attempt.has_player?(@user.id)).to eq false
    end
  end

  describe "#team_score" do
    it "returns score for team on attempt" do
      expect(@attempt.team_score).to eq 0
      @attempt.guesses.create(piece_id: @piece.id, user_id: @user.id)
      expect(@attempt.team_score).to eq 1
    end
  end

  describe "#player_score" do
    it "returns score for certain player on attempt" do
      expect(@attempt.player_score(@user.id)).to eq 0
      @attempt.guesses.create(piece_id: @piece.id, user_id: @user.id)
      expect(@attempt.player_score(@user.id)).to eq 1
      expect(@attempt.player_score(@partner.id)).to eq 0
    end
  end
end
