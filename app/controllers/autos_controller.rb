class AutosController < ApplicationController
  before_action :set_auto, only: [:show, :edit, :update, :destroy, :additionalinfo]
  
  def all
    @autos = Auto.all.order("created_at DESC")
  end
  
  def index
#    @autos = Auto.all
    @search = Auto.search do
      fulltext params[:search]
    end
      @autos = @search.results  
  end

  def show
    @auto_review = AutoReview.new
    @auto_reviews = Auto.find(params[:id]).auto_reviews.order("cached_votes_score DESC")
    @avg_score = 0
    @avg_score = @auto_reviews.inject(0) { |sum, r| sum += r.point }.to_f / @auto_reviews.count if @auto_reviews.count > 0
    
    @promotion = Promotion.order("RANDOM()").first
    
  end

  def new
    @auto = Auto.new
  end

  def additionalinfo
  end
  
  def edit
  end

  def create
    @auto = Auto.new(auto_params)

    respond_to do |format|
      if @auto.save
        format.html { redirect_to @auto, notice: 'Podcast was successfully created.' }
        format.json { render action: 'show', status: :created, location: @auto }
      else
        format.html { render action: 'new' }
        format.json { render json: @auto.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @auto.update(auto_params)
        format.html { redirect_to @auto, notice: 'Podcast was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @auto.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @auto.destroy
    respond_to do |format|
      format.html { redirect_to autos_url }
      format.json { head :no_content }
    end
  end
  
  private

    def set_auto
      @auto = Auto.find(params[:id])
    end

    def auto_params
      params.require(:auto).permit(:name, :additionalinfo, :image, :remote_image_url)
    end
  
end
