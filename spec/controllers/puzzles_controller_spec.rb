require 'spec_helper'

describe PuzzlesController do

  let(:valid_attributes) { { "name" => "MyString" } }
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all puzzles as @puzzles" do
      puzzle = Puzzle.create! valid_attributes
      get :index, {}, valid_session
      assigns(:puzzles).should eq([puzzle])
    end
  end

  describe "GET show" do
    it "assigns the requested puzzle as @puzzle" do
      puzzle = Puzzle.create! valid_attributes
      get :show, {:id => puzzle.to_param}, valid_session
      assigns(:puzzle).should eq(puzzle)
    end
  end
end