class DrugsController < ApplicationController
  before_action :set_drug, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [:new]

  def index
    @search = Drug.search do
      fulltext params[:search]
    end

    if params[:dtag]
      @drugs = Drug.tagged_with(params[:dtag])
    elsif
      @drugs = @search.results
    else
      @drugs = Drug.all
    end
  end

  def show
    @drug_review = DrugReview.new
    @drug_reviews = Drug.find(params[:id]).drug_reviews.order(created_at: :desc)
  end

  def new
    @drug = Drug.new
  end

  def edit
  end

  def create
    @drug = Drug.new(drug_params)

    respond_to do |format|
      if @drug.save
        format.html { redirect_to @drug, notice: 'Drug was successfully created.' }
        format.json { render action: 'show', status: :created, location: @drug }
      else
        format.html { render action: 'new' }
        format.json { render json: @drug.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @drug.update(drug_params)
        format.html { redirect_to @drug, notice: 'Drug was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @drug.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @drug.destroy
    respond_to do |format|
      format.html { redirect_to drugs_url }
      format.json { head :no_content }
    end
  end

  private

    def set_drug
      @drug = Drug.find(params[:id])
    end

    def drug_params
      params.require(:drug).permit(:name, :image, :tag_list, :remote_image_url)
    end
end
