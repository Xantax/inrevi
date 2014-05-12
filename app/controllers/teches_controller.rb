class TechesController < ApplicationController
  before_action :set_tech, only: [:show, :edit, :update, :destroy]

  def all
    @teches = Tech.all.order("created_at DESC")
  end
  
  def search
    @search = Tech.search do
      fulltext params[:search]
    end
    @teches = @search.results
  end
  
  def index
    @search = Tech.search do
      fulltext params[:search]
    end
   @teches = @search.results
  end

  def show
    @tech_review = TechReview.new
    @tech_reviews = Tech.find(params[:id]).tech_reviews.order("cached_votes_score DESC")
    @avg_score = 0
    @avg_score = @tech_reviews.inject(0) { |sum, r| sum += r.point }.to_f / @tech_reviews.count if @tech_reviews.count > 0
  end

  def new
    @tech = Tech.new
  end

  def edit
  end

  def create
    @tech = Tech.new(tech_params)

    respond_to do |format|
      if @tech.save
        format.html { redirect_to @tech, notice: 'Tech was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tech }
      else
        format.html { render action: 'new' }
        format.json { render json: @tech.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @tech.update(tech_params)
        format.html { redirect_to @tech, notice: 'Tech was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tech.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tech.destroy
    respond_to do |format|
      format.html { redirect_to teches_url }
      format.json { head :no_content }
    end
  end

  private

    def set_tech
      @tech = Tech.find(params[:id])
    end

    def tech_params
      params.require(:tech).permit(:name, :website, :image, :tag_list, :remote_image_url)
    end
end
