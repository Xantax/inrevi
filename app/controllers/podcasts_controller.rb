 class PodcastsController < ApplicationController
  before_action :set_podcast, only: [:show, :edit, :update, :destroy]

  def all
     @podcasts = Podcast.paginate(:page => params[:page], :per_page => 10).order("created_at DESC")
  end
   
  def index

    @search = Podcast.search do
      fulltext params[:search]
      paginate(:page => params[:page], :per_page => 10)
    end

    if params[:tag]
      @podcasts = Podcast.tagged_with(params[:tag])
    end

  end
   
   def search
     
    @search = Podcast.search do
      fulltext params[:search]
      paginate(:page => params[:page], :per_page => 10)
    end

    if params[:tag]
      @podcasts = Podcast.tagged_with(params[:tag])
    elsif
      @podcasts = @search.results.paginate(:page => params[:page], :per_page => 10)
    else
      @podcasts = Podcast.all
    end
     
    @avg_score = 0
    @avg_score = @podcast_reviews.inject(0) { |sum, r| sum += r.point }.to_f / @podcast_reviews.count if @podcast_reviews.count > 0
     
   end

  def show
    @podcast_review = PodcastReview.new
    @podcast_reviews = Podcast.find(params[:id]).podcast_reviews.paginate(:page => params[:page], :per_page => 10).order("cached_votes_score DESC")
    @avg_score = 0
    @avg_score = @podcast_reviews.inject(0) { |sum, r| sum += r.point }.to_f / @podcast_reviews.count if @podcast_reviews.count > 0
    
    @promotion = Promotion.order("RANDOM()").first
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

 end

