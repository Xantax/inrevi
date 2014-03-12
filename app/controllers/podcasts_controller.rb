class PodcastsController < ApplicationController
  before_action :set_podcast, only: [:index, :show, :edit, :update, :destroy]

  # GET /podcasts
  # GET /podcasts.json
  def index

    @search = Podcast.search do
      fulltext params[:search]
    end

    if params[:tag]
      @podcasts = Podcast.tagged_with(params[:tag])
    elsif
      @podcasts = @search.results
    else
      @podcasts = Podcast.all
    end

  end

  # GET /podcasts/1
  # GET /podcasts/1.json
  def show
    @podcast_review = PodcastReview.new
    @podcast_reviews = Podcast.find(params[:id]).podcast_reviews.order(created_at: :desc)
  end

  # GET /podcasts/new
  def new
    @podcast = Podcast.new

  end

  # GET /podcasts/1/edit
  def edit

  end

  # POST /podcasts
  # POST /podcasts.json
  def create
    @podcast = Podcast.new(podcast_params)

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

  # PATCH/PUT /podcasts/1
  # PATCH/PUT /podcasts/1.json
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

  # DELETE /podcasts/1
  # DELETE /podcasts/1.json
  def destroy
    @podcast.destroy
    respond_to do |format|
      format.html { redirect_to podcasts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_podcast
      @podcast = Podcast.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def podcast_params
      params.require(:podcast).permit(:name, :podcast_language_id, :website, :image, :tag_list, :remote_image_url)
    end

end
