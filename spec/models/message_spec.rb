require 'spec_helper'

describe Message do
  describe "#to_s" do
    it "overrides to_s and returns content" do
      message = Message.new(
        content: "Hello, World",
        sender_id: 1,
        receiver_id: 1)
      expect(message.to_s).to eq "Hello, World"
    end
  end
end
