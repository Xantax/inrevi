class FineartsController < ApplicationController
  before_action :set_fineart, only: [:show, :edit, :update, :destroy]

  def all
    @finearts = Fineart.paginate(:page => params[:page], :per_page => 10).order("created_at DESC")
  end
  
  def search
    
    @search = Fineart.search do
      fulltext params[:search]
      paginate(:page => params[:page], :per_page => 10)
    end
    @finearts = @search.results
    
  end
  
  def index
    
    @search = Fineart.search do
      fulltext params[:search]
      paginate(:page => params[:page], :per_page => 10)
    end
   @finearts = @search.results
    
  end

  def show
    @fineart_review = FineartReview.new
    @fineart_reviews = Fineart.find(params[:id]).fineart_reviews.paginate(:page => params[:page], :per_page => 10).order("cached_votes_score DESC")
    @avg_score = 0
    @avg_score = @fineart_reviews.inject(0) { |sum, r| sum += r.point }.to_f / @fineart_reviews.count if @fineart_reviews.count > 0
    
    @promotion = Promotion.order("RANDOM()").first
  end

  def new
    @fineart = Fineart.new
  end

  def edit
  end

  def create
    @fineart = Fineart.new(fineart_params)
    @fineart.user = current_user

      if @fineart.save
        redirect_to @fineart
      else
        render action: 'new'
      end
  end

  def update
      if @fineart.update(fineart_params)
        redirect_to @fineart
      else
        render action: 'edit'
      end
  end

  def destroy
    @fineart.destroy
      redirect_to finearts_url
  end

  private

    def set_fineart
      @fineart = Fineart.find(params[:id])
    end

    def fineart_params
      params.require(:fineart).permit(:name, :image, :tag_list, :remote_image_url, :user_id)
    end

end
