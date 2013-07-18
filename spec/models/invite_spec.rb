require 'spec_helper'

describe Invite do
  before :each do
    @puzzle = Puzzle.create(
      name: "States in the United States",
      topic: "geography",
      format: "map")
    @attempt = @puzzle.attempts.create!
    @invite = Invite.create(
      sender_id: 1,
      receiver_id: 2,
      puzzle_id: @puzzle.id,
      attempt_id: @attempt.id)
  end

  describe "#mark_as_read" do
    it "changes unread to false" do
      expect(@invite.unread?).to eq true
      @invite.mark_as_read
      expect(@invite.unread?).to eq false
    end
  end

  describe "#mark_as_unread" do
    it "changes unread to false" do
      expect(@invite.unread?).to eq true
      @invite.mark_as_read
      expect(@invite.unread?).to eq false
      @invite.mark_as_unread
      expect(@invite.unread?).to eq true
    end
  end

  describe "#message" do
    it "spits out a message string" do
      expect(@invite.message.class).to eq String
    end
  end
end
