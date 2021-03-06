require 'spec_helper'

describe User do
  before :each do
    @user = User.create(name: "Geoff", email: "geoff@enigmates.com")
    @auth_hash =
      {"provider" => "facebook",
       "uid" => "1234"}
    @puzzle = Puzzle.create(
      name: "States in the United States",
      topic: "geography",
      format: "map")
    @attempt = @puzzle.attempts.create!
    @inviter = User.create(name: "Shane", email: "shane@enigmates.com")
  end

  describe "#add_provider" do
    context "given user is not authorized for provider" do
      it "adds a new provider" do
        expect(@user.authorizations.count).to eq 0
        @user.add_provider(@auth_hash)
        expect(@user.authorizations.count).to eq 1
      end
    end
  end

  describe "#to_s" do
    it "overwrites string for user" do
      expect(@user.to_s).to eq @user.name
    end
  end

  describe "#invited?" do
    it "returns true if user has been invited already" do
      invite = Invite.create(
        sender_id: @inviter.id,
        receiver_id: @user.id,
        puzzle_id: @puzzle.id,
        attempt_id: @attempt.id)
      expect(@user.invited?(@attempt.id, @inviter.id)).to eq true
    end

    it "returns false if user has not been invited already" do
      expect(@user.invited?(@attempt.id, @inviter.id)).to eq false
    end
  end

  describe "#invites" do
    it "returns all invites where user is receiver" do
      invite = Invite.create(
        sender_id: @inviter.id,
        receiver_id: @user.id,
        puzzle_id: @puzzle.id,
        attempt_id: @attempt.id)
      expect(@user.invites).to eq [invite]
    end
  end

  describe "#unread_invites" do
    it "returns all unread invites" do
      expect(@user.unread_invites).to eq []
      invite = Invite.create(
        sender_id: @inviter.id,
        receiver_id: @user.id,
        puzzle_id: @puzzle.id,
        attempt_id: @attempt.id)
      expect(@user.unread_invites).to eq [invite]
    end
  end

  describe "#has_unread_invites?" do
    it "returns true if user has unread invites" do
      invite = Invite.create(
        sender_id: @inviter.id,
        receiver_id: @user.id,
        puzzle_id: @puzzle.id,
        attempt_id: @attempt.id)
      expect(@user.has_unread_invites?).to eq true
    end

    it "returns false if user has read all invites" do
      invite = Invite.create(
        sender_id: @inviter.id,
        receiver_id: @user.id,
        puzzle_id: @puzzle.id,
        attempt_id: @attempt.id)
      invite.unread = false
      invite.save
      expect(@user.has_unread_invites?).to eq false
    end
  end

  describe "#mark_invites_as_read" do
    it "marks all relevent invites as read" do
      invite = Invite.create(
        sender_id: @inviter.id,
        receiver_id: @user.id,
        puzzle_id: @puzzle.id,
        attempt_id: @attempt.id)
      expect(@user.has_unread_invites?).to eq true
      
      @user.mark_invites_as_read(@attempt.id)
      expect(@user.has_unread_invites?).to eq false
    end
  end
end
