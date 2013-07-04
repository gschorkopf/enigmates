class GuessesController < ApplicationController
  def create
    @attempt = Attempt.find(params[:attempt_id])
    pieces = @attempt.puzzle.contents

    if pieces.include?(params[:guess].titleize)
      @guess = params[:guess].titleize
    else
      redirect_to puzzle_attempt_path(@attempt.puzzle, @attempt)
    end
  end
end