class AttemptsController < ApplicationController
  before_filter :require_login
  
  def show
    @attempt = Attempt.find(params[:id])
    @puzzle = @attempt.puzzle
  end

  def create
    puzzle = Puzzle.find(params[:puzzle_id])
    @attempt = puzzle.attempts.create

    redirect_to puzzle_attempt_path(puzzle, @attempt)
  end
end
