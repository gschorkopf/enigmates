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

  describe "#to_s" do
    it "overwrites string for puzzle" do
      expect(@puzzle.to_s).to eq @puzzle.name
    end
  end

  describe "#contents" do
    it "returns array the content columns of each piece" do
      expect(@puzzle.contents).to eq ["Alabama", "Alaska", "Arizona"]
    end

    it "also contains alternative solutions" do
      @puzzle.pieces.create(content: "New Jersey", alternatives: "Jersey")
      expect(@puzzle.contents.include?("Jersey")).to eq true
    end
  end

  describe "#total" do
    it "returns the count for pieces in puzzle" do
      expect(@puzzle.total).to eq 3
    end
  end
end
