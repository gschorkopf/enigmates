class AttemptsController < ApplicationController
  def show
    @attempt = Attempt.find(params[:id])
    @puzzle = @attempt.puzzle
  end

  def create
    puzzle = Puzzle.find(params[:puzzle_id])
    @attempt = puzzle.attempts.create

    redirect_to puzzle_attempt_path(puzzle, @attempt), notice: "Good luck!"
  end
end
