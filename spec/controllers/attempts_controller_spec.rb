require 'spec_helper'

describe AttemptsController do
  let(:valid_session) { {} }

  before :each do
    @puzzle = Puzzle.create(
      name: "States in the United States",
      topic: "geography",
      format: "map")
    @user = User.create(name: "Geoff", email: "geoff@enigmates.com")
    ApplicationController.any_instance.stub(:current_user).and_return(@user)
  end

  describe "GET show" do
    it "get request should always be success" do
      attempt = @puzzle.attempts.create!
      get :show, {id: attempt.to_param, puzzle_id: @puzzle.to_param}, valid_session
      expect(response.status).to eq 200
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Attempt" do
        expect {
          post :create, {puzzle_id: @puzzle.id}, valid_session
        }.to change(Attempt, :count).by(1)
      end
    end

    describe "with invalid params"
  end
end