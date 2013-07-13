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
      @invitee1 = User.create(name: "Shane", email: "shane@enigmates.com")
      ApplicationController.any_instance.stub(:current_user).and_return(@user)
    end

    context "user is not already added to attempt" do
      it "adds user to attempt" do
        expect(@invitee1.attempts.count).to eq 0
        post  :create,
              attempt_id: @attempt.id, 
              name: "Shane",
              format: :js
        expect(@invitee1.attempts.count).to eq 1
        expect(@invitee1.invites.count).to eq 1
      end

      it "does not add user if max has been reached" do
        @invitee2 = User.create(name: "Shane", email: "shane@enigmates.com")
        @invitee3 = User.create(name: "Josh", email: "josh@enigmates.com")
        @invitee4 = User.create(name: "Chris", email: "chris@enigmates.com")

        @attempt.add_player(@invitee1.id)
        @attempt.add_player(@invitee2.id)
        @attempt.add_player(@invitee3.id)

        post  :create,
              attempt_id: @attempt.id, 
              name: "Chris",
              format: :js
        expect(@invitee4.attempts.count).to eq 0
        expect(@invitee4.invites.count).to eq 0
      end
    end

    context "user has been invited already by sender" do
      it "does not re-add user / create new invite" do
        @attempt.add_player(@invitee1.id)
        invite = Invite.create(
          sender_id: @user.id,
          receiver_id: @invitee1.id,
          puzzle_id: @puzzle.id,
          attempt_id: @attempt.id)
        expect(@invitee1.invites.count).to eq 1

        post  :create,
              attempt_id: @attempt.id, 
              name: "Shane",
              format: :js

        expect(@invitee1.invites.count).to eq 1
      end
    end
  end
end