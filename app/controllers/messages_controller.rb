class MessagesController < ApplicationController
  def create
    @attempt = Attempt.find(params[:attempt_id])
    if params[:message] == "enter"
      @message = "#{current_user} has joined the puzzle."
    else
      @message = "#{current_user} has left the puzzle."
    end
  end
end