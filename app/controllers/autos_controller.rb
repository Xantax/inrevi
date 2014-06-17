class AutosController < ApplicationController
  before_action :set_auto, only: [:show, :edit, :update, :destroy, :additionalinfo]
  before_action :signed_in_user, except: [:show]
  
  def all
    if current_user.admin?
      @autos = Auto.paginate(:page => params[:page], :per_page => 15).order("created_at DESC")
    end
  end
  
  def index
  end

  def search    
    @autos = Auto.search(params[:search]).paginate(:page => params[:page], :per_page => 15)
  end
  
  def show
    @auto_review = AutoReview.new
    @auto_reviews = Auto.find(params[:id]).auto_reviews.paginate(:page => params[:page], :per_page => 10).order("cached_votes_score DESC")
    @avg_score = 0
    @avg_score = @auto_reviews.inject(0) { |sum, r| sum += r.point }.to_f / @auto_reviews.count if @auto_reviews.count > 0
    
    @promotion = Promotion.order("RANDOM()").first
    
  end

  def new
    @auto = Auto.new
  end

  def additionalinfo
    @auto_review = AutoReview.new
    @auto_reviews = Auto.find(params[:id]).auto_reviews.order("cached_votes_score DESC")
    @avg_score = 0
    @avg_score = @auto_reviews.inject(0) { |sum, r| sum += r.point }.to_f / @auto_reviews.count if @auto_reviews.count > 0
    
    @promotion = Promotion.order("RANDOM()").first
  end
  
  def edit
    unless current_user.admin?
      redirect_to root_path
    end
  end

  def create
    @auto = Auto.new(auto_params)
    @auto.user = current_user

      if @auto.save
        redirect_to @auto
      else
        render action: 'new'
      end
  end

  def update
    if current_user.admin?
        if @auto.update(auto_params)
          redirect_to @auto
        else
          render action: 'edit'
        end
    end
  end

  def destroy
    if current_user.admin?
      @auto.destroy
      redirect_to autos_url
    end
  end
  
  private

    def set_auto
      @auto = Auto.find(params[:id])
    end

    def auto_params
      params.require(:auto).permit(:name, :additionalinfo, :image, :remote_image_url, :category, :user_id)
    end
  
end
