require 'spec_helper'

describe PuzzlesController do

  let(:valid_attributes) { { "name" => "States of the United States" } }
  let(:valid_session) { {} }
  before :each do
    @user = User.create(name: "Geoff", email: "geoff@enigmates.com")
    ApplicationController.any_instance.stub(:current_user).and_return(@user)
  end

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