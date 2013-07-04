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

  describe "GET new" do
    it "assigns a new puzzle as @puzzle" do
      get :new, {}, valid_session
      assigns(:puzzle).should be_a_new(Puzzle)
    end
  end

  describe "GET edit" do
    it "assigns the requested puzzle as @puzzle" do
      puzzle = Puzzle.create! valid_attributes
      get :edit, {:id => puzzle.to_param}, valid_session
      assigns(:puzzle).should eq(puzzle)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Puzzle" do
        expect {
          post :create, {:puzzle => valid_attributes}, valid_session
        }.to change(Puzzle, :count).by(1)
      end

      it "assigns a newly created puzzle as @puzzle" do
        post :create, {:puzzle => valid_attributes}, valid_session
        assigns(:puzzle).should be_a(Puzzle)
        assigns(:puzzle).should be_persisted
      end

      it "redirects to the created puzzle" do
        post :create, {:puzzle => valid_attributes}, valid_session
        response.should redirect_to(Puzzle.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved puzzle as @puzzle" do
        # Trigger the behavior that occurs when invalid params are submitted
        Puzzle.any_instance.stub(:save).and_return(false)
        post :create, {:puzzle => { "name" => "invalid value" }}, valid_session
        assigns(:puzzle).should be_a_new(Puzzle)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Puzzle.any_instance.stub(:save).and_return(false)
        post :create, {:puzzle => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested puzzle" do
        puzzle = Puzzle.create! valid_attributes
        # Assuming there are no other puzzles in the database, this
        # specifies that the Puzzle created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Puzzle.any_instance.should_receive(:update_attributes).with({ "name" => "MyString" })
        put :update, {:id => puzzle.to_param, :puzzle => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested puzzle as @puzzle" do
        puzzle = Puzzle.create! valid_attributes
        put :update, {:id => puzzle.to_param, :puzzle => valid_attributes}, valid_session
        assigns(:puzzle).should eq(puzzle)
      end

      it "redirects to the puzzle" do
        puzzle = Puzzle.create! valid_attributes
        put :update, {:id => puzzle.to_param, :puzzle => valid_attributes}, valid_session
        response.should redirect_to(puzzle)
      end
    end

    describe "with invalid params" do
      it "assigns the puzzle as @puzzle" do
        puzzle = Puzzle.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Puzzle.any_instance.stub(:save).and_return(false)
        put :update, {:id => puzzle.to_param, :puzzle => { "name" => "invalid value" }}, valid_session
        assigns(:puzzle).should eq(puzzle)
      end

      it "re-renders the 'edit' template" do
        puzzle = Puzzle.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Puzzle.any_instance.stub(:save).and_return(false)
        put :update, {:id => puzzle.to_param, :puzzle => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested puzzle" do
      puzzle = Puzzle.create! valid_attributes
      expect {
        delete :destroy, {:id => puzzle.to_param}, valid_session
      }.to change(Puzzle, :count).by(-1)
    end

    it "redirects to the puzzles list" do
      puzzle = Puzzle.create! valid_attributes
      delete :destroy, {:id => puzzle.to_param}, valid_session
      response.should redirect_to(puzzles_url)
    end
  end

end
