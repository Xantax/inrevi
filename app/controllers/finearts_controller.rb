class FineartsController < ApplicationController
  before_action :set_fineart, only: [:show, :edit, :update, :destroy]

  # GET /finearts
  # GET /finearts.json
  def index
    @finearts = Fineart.all
  end

  # GET /finearts/1
  # GET /finearts/1.json
  def show
  end

  # GET /finearts/new
  def new
    @fineart = Fineart.new
  end

  # GET /finearts/1/edit
  def edit
  end

  # POST /finearts
  # POST /finearts.json
  def create
    @fineart = Fineart.new(fineart_params)

    respond_to do |format|
      if @fineart.save
        format.html { redirect_to @fineart, notice: 'Fineart was successfully created.' }
        format.json { render action: 'show', status: :created, location: @fineart }
      else
        format.html { render action: 'new' }
        format.json { render json: @fineart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /finearts/1
  # PATCH/PUT /finearts/1.json
  def update
    respond_to do |format|
      if @fineart.update(fineart_params)
        format.html { redirect_to @fineart, notice: 'Fineart was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @fineart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /finearts/1
  # DELETE /finearts/1.json
  def destroy
    @fineart.destroy
    respond_to do |format|
      format.html { redirect_to finearts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fineart
      @fineart = Fineart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fineart_params
      params.require(:fineart).permit(:name, :user_id)
    end
end
