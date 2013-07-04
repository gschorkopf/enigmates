class AttemptsController < ApplicationController
  def index
    @attempts = Attempt.all
  end

  def show
    @attempt = Attempt.find(params[:id])
  end

  def new
    @attempt = Attempt.new
  end

  def create
    @attempt = Attempt.new(params[:attempt])

    if @attempt.save
      redirect_to @attempt, notice: 'Good luck!'
    else
      render action: "new"
    end
  end
end
