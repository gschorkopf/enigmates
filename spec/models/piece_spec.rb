require 'spec_helper'

describe Piece do
  before :each do
    @piece = Piece.create(:content=>"Alabama")
  end

  describe "#to_s" do
    it "overwrites string for piece" do
      expect(@piece.to_s).to eq @piece.content
    end
  end
end
