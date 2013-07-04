class GuessesController < ApplicationController
  def create
    @attempt = Attempt.find(params[:attempt_id])
    pieces = @attempt.puzzle.contents

    if pieces.include?(params[:guess].titleize)
      @guess = params[:guess].titleize
    else
      render @attempt
    end
  end
end