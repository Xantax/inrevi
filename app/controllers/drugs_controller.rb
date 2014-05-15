class DrugsController < ApplicationController
  before_action :set_drug, only: [:show, :edit, :update, :destroy, :additionalinfo]

  def all
    @drugs = Drug.paginate(:page => params[:page], :per_page => 10).order("created_at DESC")
  end
  
  def index
    @search = Drug.search do
      fulltext params[:search]
    end
    @drugs = @search.results
  end
  
  def search
    @search = Drug.search do
      fulltext params[:search]
      paginate(:page => params[:page], :per_page => 10)
    end
    @drugs = @search.results
  end

  def show
    @drug_review = DrugReview.new
    @drug_reviews = Drug.find(params[:id]).drug_reviews.order("cached_votes_score DESC")
    
    @avg_score = 0
    @avg_score = @drug_reviews.inject(0) { |sum, r| sum += r.point }.to_f / @drug_reviews.count if @drug_reviews.count > 0
    
    @promotion = Promotion.order("RANDOM()").first
  end

  def additionalinfo
    @drug_review = DrugReview.new
    @drug_reviews = Drug.find(params[:id]).drug_reviews.order("cached_votes_score DESC")
    
    @avg_score = 0
    @avg_score = @drug_reviews.inject(0) { |sum, r| sum += r.point }.to_f / @drug_reviews.count if @drug_reviews.count > 0
    
    @promotion = Promotion.order("RANDOM()").first
  end
  
  def new
    @drug = Drug.new
  end

  def edit
  end

  def create
    @drug = Drug.new(drug_params)
    @drug.user = current_user

    respond_to do |format|
      if @drug.save
        redirect_to @drug
      else
        render action: 'new'
      end
  end

  def update
    respond_to do |format|
      if @drug.update(drug_params)
        redirect_to @drug
      else
        render action: 'edit'
      end
  end

  def destroy
    @drug.destroy
      redirect_to drugs_url
  end

  private

    def set_drug
      @drug = Drug.find(params[:id])
    end

    def drug_params
      params.require(:drug).permit(:name, :image, :additionalinfo, :remote_image_url, :user_id)
    end
end
