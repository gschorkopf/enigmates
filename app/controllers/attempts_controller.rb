class AttemptsController < ApplicationController
  before_filter :require_login
  before_filter :require_player, only: [:show]
  
  def show
    @all_users = all_users
    current_user.mark_invites_as_read(params[:id])

    @attempt = Attempt.find(params[:id])
    @puzzle = @attempt.puzzle
  end

  def create
    puzzle = Puzzle.find(params[:puzzle_id])
    @attempt = puzzle.attempts.create(mode: params[:mode])

    @attempt.add_player(current_user.id)

    redirect_to puzzle_attempt_path(puzzle, @attempt)
  end

  def build_chart
    @attempt = Attempt.find(params[:attempt_id])
  end
end
