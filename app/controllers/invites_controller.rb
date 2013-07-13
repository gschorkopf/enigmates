class InvitesController < ApplicationController
  def create
    @attempt = Attempt.find(params[:attempt_id])
    @user = User.find_by_name(params[:name])

    if @user && @attempt.within_player_limit?
      if @user.invited?(@attempt.id, current_user.id)
        invite = Invite.where(
          attempt_id: @attempt.id,
          sender_id: current_user.id).first
        @message = invite.message("re-invited")
      else
        @attempt.add_player(@user.id)
        invite = Invite.create(
          sender_id: current_user.id,
          receiver_id: @user.id,
          puzzle_id: @attempt.puzzle.id,
          attempt_id: @attempt.id)
        @message = invite.message("invited")
      end
    else
      @warning = "Player limit (4) has been reached!"
    end
  end
end