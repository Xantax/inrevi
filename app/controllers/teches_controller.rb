class TechesController < ApplicationController
  before_action :set_tech, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, except: [:show, :index, :search]
  before_action :only_admin, only: [:edit, :update, :destroy, :all]

  def all
      @teches = Tech.paginate(:page => params[:page], :per_page => 15).order("created_at DESC")
  end
  
  def search
    @teches = Tech.search(params[:search]).paginate(:page => params[:page], :per_page => 15)
  end
  
  def index
  end

  def show
    @tech_review = TechReview.new
    @tech_reviews = Tech.find(params[:id]).tech_reviews.paginate(:page => params[:page], :per_page => 15).order("cached_votes_score DESC")
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
    @tech.user = current_user

      if @tech.save
        redirect_to @tech
      else
        render action: 'new'
      end
  end

  def update
      if @tech.update(tech_params)
        redirect_to @tech
      else
        render action: 'edit'
      end
  end

  def destroy
    @tech.destroy
      redirect_to teches_url
  end

  private

    def set_tech
      @tech = Tech.find(params[:id])
    end

    def tech_params
      params.require(:tech).permit(:name, :website, :image, :tag_list, :remote_image_url, :user_id)
    end
    
    def only_admin
      unless current_user.admin?
        redirect_to root_path
      end
    end
  
end
