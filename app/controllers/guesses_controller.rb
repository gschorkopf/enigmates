class GuessesController < ApplicationController
  before_filter :require_player

  def create
    guess = params[:guess].downcase.gsub("'", "")
    @attempt = Attempt.find(params[:attempt_id])
    pieces = @attempt.puzzle.contents

    if pieces.include?(guess)
      piece = Piece.find_by_content(guess) || Piece.find_by_alternatives(guess) 

      if @attempt.mode == "co-op"
        @guess = @attempt.guesses.create(
                  piece_id: piece.id,
                  user_id: current_user.id) unless @attempt.piece_solved?(piece.id)
        @attempt.complete if @attempt.team_score == @attempt.puzzle.total
      elsif @attempt.mode == "versus"
        @guess = @attempt.guesses.create(
                  piece_id: piece.id,
                  user_id: current_user.id) unless @attempt.piece_solved_by_player?(piece.id, current_user.id)
        @attempt.complete if @attempt.player_score(current_user.id) == @attempt.puzzle.total
      end
    end
  end
end