require 'spec_helper'

describe Invite do
  describe "#mark_as_read" do
    it "changes unread to false" do
      invite = Invite.create(
        sender_id: 1,
        receiver_id: 2,
        puzzle_id: 1,
        attempt_id: 1)
      expect(invite.unread?).to eq true
      invite.mark_as_read
      expect(invite.unread?).to eq false
    end
  end
end
