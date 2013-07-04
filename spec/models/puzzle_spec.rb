require 'spec_helper'

describe Puzzle do
  before :each do
    @puzzle = Puzzle.create(
      name: "States in the United States",
      topic: "geography",
      format: "map")
    @puzzle.pieces.create([ 
      {:content=>"Alabama"}, 
      {:content=>"Alaska"}, 
      {:content=>"Arizona"}])
  end

  describe "#contents" do
    it "returns array the content columns of each piece" do
      expect(@puzzle.contents).to eq ["Alabama", "Alaska", "Arizona"]
    end
  end
end
