class InvitesController < ApplicationController
  def create
    @attempt = Attempt.find(params[:attempt_id])
    @user = User.find_by_name(params[:name])

    if @user && @attempt.within_player_limit?
      if !@attempt.has_player?(@user.id)
        @attempt.add_player(@user.id)
        @message = "#{current_user} has invited you to attempt "
      else
        @message = "#{current_user} has re-invited you to attempt "
      end
    else
      @warning = "Player limit (4) has been reached!"
    end
  end
end