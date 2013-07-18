class InvitesController < ApplicationController
  def create
    @attempt = Attempt.find(params[:attempt_id])
    @user = User.find_by_name(params[:name])

    if @user # Will include case for current_user
      if @attempt.within_player_limit?
        if @user.invited?(@attempt.id, current_user.id)
          Invite.where(
            attempt_id: @attempt.id,
            sender_id: current_user.id).first.mark_as_unread
          @warning = "#{current_user} has re-sent an invitation to #{@user}!"; @status = :repeat
        else
          @attempt.add_player(@user.id)
          @invite = Invite.create(
            sender_id: current_user.id,
            receiver_id: @user.id,
            puzzle_id: @attempt.puzzle.id,
            attempt_id: @attempt.id)
          @message = "#{current_user} has sent an invitation to #{@user}!"; @status = :first
        end
      else
        @warning = "Player limit (4) has been reached!"; @status = :limit
      end
    end
  end
end