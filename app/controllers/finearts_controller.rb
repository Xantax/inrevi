class FineartsController < ApplicationController
  before_action :set_fineart, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, except: [:show, :index, :search]
  before_action :only_admin, only: [:edit, :update, :destroy, :all]

  def all
      @finearts = Fineart.paginate(:page => params[:page], :per_page => 15).order("created_at DESC")
  end
  
  def search
    @finearts = Fineart.search(params[:search]).paginate(:page => params[:page], :per_page => 15)
  end
  
  def index
  end

  def show
    @fineart_review = FineartReview.new
    @fineart_reviews = Fineart.find(params[:id]).fineart_reviews.paginate(:page => params[:page], :per_page => 15).order("cached_votes_score DESC")
    @avg_score = 0
    @avg_score = @fineart_reviews.inject(0) { |sum, r| sum += r.point }.to_f / @fineart_reviews.count if @fineart_reviews.count > 0
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
    
    def only_admin
      unless current_user.admin?
        redirect_to root_path
      end
    end

end
