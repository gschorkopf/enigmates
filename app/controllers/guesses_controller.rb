class GuessesController < ApplicationController
  # before_filter :require_player

  def create
    @attempt = Attempt.find(params[:attempt_id])
    pieces = @attempt.puzzle.contents

    if pieces.include?(params[:guess])
      piece = Piece.find_by_content(params[:guess])
      @guess = @attempt.guesses.create(
                piece_id: piece.id,
                user_id: current_user.id) unless @attempt.piece_exists?(piece.id)
    end
  end
end