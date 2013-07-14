class MessagesController < ApplicationController
  def create
    @message = Message.create(
      content: params[:create],
      sender_id: current_user.id,
      receiver_id: params[:receiver_id])
  end
end