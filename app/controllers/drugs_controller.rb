class DrugsController < ApplicationController
  before_action :set_drug, only: [:show, :edit, :update, :destroy, :additionalinfo]
  before_action :signed_in_user, except: [:show]

  def all
    if current_user.admin?
      @drugs = Drug.paginate(:page => params[:page], :per_page => 15).order("created_at DESC")
    end
  end
  
  def index
  end
  
  def search
    @drugs = Drug.search(params[:search]).paginate(:page => params[:page], :per_page => 15)
  end

  def show
    @drug_review = DrugReview.new
    @drug_reviews = Drug.find(params[:id]).drug_reviews.paginate(:page => params[:page], :per_page => 15).order("cached_votes_score DESC")
    
    @avg_score = 0
    @avg_score = @drug_reviews.inject(0) { |sum, r| sum += r.point }.to_f / @drug_reviews.count if @drug_reviews.count > 0
    
    @promotion = Promotion.order("RANDOM()").first
  end
  
  def new
    @drug = Drug.new
  end

  def edit
    unless current_user.admin?
      redirect_to root_path
    end
  end

  def create
    @drug = Drug.new(drug_params)
    @drug.user = current_user

      if @drug.save
        redirect_to @drug
      else
        render action: 'new'
      end
  end

  def update
      if @drug.update(drug_params)
        redirect_to @drug
      else
        render action: 'edit'
      end
  end

  def destroy
    if current_user.admin?
      @drug.destroy
        redirect_to drugs_url
    end
  end

  private

    def set_drug
      @drug = Drug.find(params[:id])
    end

    def drug_params
      params.require(:drug).permit(:name, :image, :additionalinfo, :remote_image_url, :user_id)
    end
end
