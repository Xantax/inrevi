 class PodcastsController < ApplicationController
   before_action :set_podcast, only: [:show, :edit, :update, :destroy]
   before_action :signed_in_user, except: [:show]
   before_action :only_admin, only: [:edit, :update, :destroy, :all]

  def all
       @podcasts = Podcast.paginate(:page => params[:page], :per_page => 15).order("created_at DESC")
  end
   
  def index   
  end
   
   def search     
     @podcasts = Podcast.search(params[:search]).paginate(:page => params[:page], :per_page => 15)
   end

  def show
    @podcast_review = PodcastReview.new
    @podcast_reviews = Podcast.find(params[:id]).podcast_reviews.paginate(:page => params[:page], :per_page => 15).order("cached_votes_score DESC")
    @avg_score = 0
    @avg_score = @podcast_reviews.inject(0) { |sum, r| sum += r.point }.to_f / @podcast_reviews.count if @podcast_reviews.count > 0
  end

  def new
    @podcast =  Podcast.new
  end

  def edit
  end

  def create
    @podcast =  Podcast.new(podcast_params)
    @podcast.user = current_user

      if @podcast.save
        redirect_to @podcast
      else
        render action: 'new'
      end
  end

  def update
      if @podcast.update(podcast_params)
        redirect_to @podcast
      else
        render action: 'edit'
      end
  end

  def destroy
      @podcast.destroy
        redirect_to podcasts_url
  end

  private

    def set_podcast
      @podcast = Podcast.find(params[:id])
    end

    def podcast_params
      params.require(:podcast).permit(:name, :user_id, :website, :image, :tag_list, :remote_image_url)
    end
    
    def only_admin
      unless current_user.admin?
        redirect_to root_path
      end
    end

 end

