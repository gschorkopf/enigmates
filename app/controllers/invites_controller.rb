class InvitesController < ApplicationController
  def create
    @attempt = Attempt.find(params[:attempt_id])

    @user = User.find_by_name(params[:name])
    @attempt.add_player(@user.id) if (@user && !@attempt.has_player?(@user.id))

    @message = "#{current_user} has invited you to attempt "
  end
end