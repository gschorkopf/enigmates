class PiecesController < ApplicationController
  # GET /pieces
  # GET /pieces.json
  def index
    @pieces = Piece.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pieces }
    end
  end

  # GET /pieces/1
  # GET /pieces/1.json
  def show
    @piece = Piece.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @piece }
    end
  end

  # GET /pieces/new
  # GET /pieces/new.json
  def new
    @piece = Piece.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @piece }
    end
  end

  # GET /pieces/1/edit
  def edit
    @piece = Piece.find(params[:id])
  end

  # POST /pieces
  # POST /pieces.json
  def create
    @piece = Piece.new(params[:piece])

    respond_to do |format|
      if @piece.save
        format.html { redirect_to @piece, notice: 'Piece was successfully created.' }
        format.json { render json: @piece, status: :created, location: @piece }
      else
        format.html { render action: "new" }
        format.json { render json: @piece.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pieces/1
  # PUT /pieces/1.json
  def update
    @piece = Piece.find(params[:id])

    respond_to do |format|
      if @piece.update_attributes(params[:piece])
        format.html { redirect_to @piece, notice: 'Piece was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @piece.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pieces/1
  # DELETE /pieces/1.json
  def destroy
    @piece = Piece.find(params[:id])
    @piece.destroy

    respond_to do |format|
      format.html { redirect_to pieces_url }
      format.json { head :no_content }
    end
  end
end
