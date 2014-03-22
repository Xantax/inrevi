class Media::PodcastsController < ApplicationController
  before_action :set_podcast, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [:new]

  def index

    @search = Media::Podcast.search do
      fulltext params[:search]
    end

    if params[:tag]
      @podcasts = Media::Podcast.tagged_with(params[:tag])
    elsif
      @podcasts = @search.results
    else
      @podcasts = Media::Podcast.all
    end

  end

  def show
    @podcast_review = Media::PodcastReview.new
    @podcast_reviews = Media::Podcast.find(params[:id]).podcast_reviews.order(created_at: :desc)
  end

  def new
    @podcast = Media::Podcast.new
  end

  def edit
  end

  def create
    @podcast = Media::Podcast.new(podcast_params)

    respond_to do |format|
      if @podcast.save
        format.html { redirect_to @podcast, notice: 'Podcast was successfully created.' }
        format.json { render action: 'show', status: :created, location: @podcast }
      else
        format.html { render action: 'new' }
        format.json { render json: @podcast.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @podcast.update(podcast_params)
        format.html { redirect_to @podcast, notice: 'Podcast was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @podcast.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @podcast.destroy
    respond_to do |format|
      format.html { redirect_to podcasts_url }
      format.json { head :no_content }
    end
  end

  private

    def set_podcast
      @podcast = Media::Podcast.find(params[:id])
    end

    def podcast_params
      params.require(:podcast).permit(:name, :podcast_language_id, :website, :image, :tag_list, :remote_image_url)
    end

end
