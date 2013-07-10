class GuessesController < ApplicationController
  before_filter :require_player

  def create
    guess = params[:guess].downcase
    @attempt = Attempt.find(params[:attempt_id])
    pieces = @attempt.puzzle.contents

    if pieces.include?(guess)
      piece = Piece.find_by_content(guess)
      @guess = @attempt.guesses.create(
                piece_id: piece.id,
                user_id: current_user.id) unless @attempt.piece_exists?(piece.id)
    end
  end
end