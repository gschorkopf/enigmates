class InvitesController < ApplicationController
  def create
    @attempt = Attempt.find(params[:attempt_id])
    @user = User.find_by_name(params[:name])

    if @user
      if !@attempt.has_player?(@user.id) && @attempt.within_player_limit?
        @attempt.add_player(@user.id)
        @notice = "#{current_user} has invited you to attempt "
      else
        @warning = "Player limit (4) has been reached!"
      end
    end
  end
end