class PuzzlesController < ApplicationController
  before_filter :require_login

  def index
    @puzzles = Puzzle.all
  end
end
