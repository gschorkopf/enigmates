class PuzzlesController < ApplicationController
  def index
    @puzzles = Puzzle.all
  end

  def show
    @puzzle = Puzzle.find(params[:id])
  end

  def new
    @puzzle = Puzzle.new
  end

  def create
    @puzzle = Puzzle.new(params[:puzzle])

    if @puzzle.save
      redirect_to @puzzle, notice: 'Puzzle was successfully created.'
    else
      render action: "new"
    end
  end
end
