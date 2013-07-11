require 'spec_helper'

describe InvitesController do
  describe "POST create" do
    before :each do
      @puzzle = Puzzle.create(
        name: "States in the United States",
        topic: "geography",
        format: "map")
      @attempt = @puzzle.attempts.create!
      @user = User.create(name: "Geoff", email: "geoff@enigmates.com")
      @attempt.add_player(@user.id)
      @invitee = User.create(name: "Shane", email: "shane@enigmates.com")
      ApplicationController.any_instance.stub(:current_user).and_return(@user)
    end

    context "user is not already added to attempt" do
      it "adds user to attempt" do
        expect(@invitee.attempts.count).to eq 0
        post  :create,
              attempt_id: @attempt.id, 
              name: "Shane",
              format: :js
        expect(@invitee.attempts.count).to eq 1
      end
    end
  end
end