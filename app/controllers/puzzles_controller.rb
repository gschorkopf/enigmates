class PuzzlesController < ApplicationController
  before_filter :require_login

  def index
    @puzzles = Puzzle.all
  end

  def show
    @puzzle = Puzzle.find(params[:id])
  end
end
