class AttemptsController < ApplicationController
  before_filter :require_login
  before_filter :require_player, only: [:show]
  
  def show
    @attempt = Attempt.find(params[:id])
    @puzzle = @attempt.puzzle
  end

  def create
    puzzle = Puzzle.find(params[:puzzle_id])
    @attempt = puzzle.attempts.create
    @attempt.add_player(current_user.id)

    redirect_to puzzle_attempt_path(puzzle, @attempt)
  end
end
