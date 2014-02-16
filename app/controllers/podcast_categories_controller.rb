class PodcastCategoriesController < ApplicationController
  before_action :set_podcast_category, only: [:show, :edit, :update, :destroy]

  # GET /podcast_categories
  # GET /podcast_categories.json
  def index
    @podcast_categories = PodcastCategory.all
  end

  # GET /podcast_categories/1
  # GET /podcast_categories/1.json
  def show
  end

  # GET /podcast_categories/new
  def new
    @podcast_category = PodcastCategory.new
  end

  # GET /podcast_categories/1/edit
  def edit
  end

  # POST /podcast_categories
  # POST /podcast_categories.json
  def create
    @podcast_category = PodcastCategory.new(podcast_category_params)

    respond_to do |format|
      if @podcast_category.save
        format.html { redirect_to @podcast_category, notice: 'Podcast category was successfully created.' }
        format.json { render action: 'show', status: :created, location: @podcast_category }
      else
        format.html { render action: 'new' }
        format.json { render json: @podcast_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /podcast_categories/1
  # PATCH/PUT /podcast_categories/1.json
  def update
    respond_to do |format|
      if @podcast_category.update(podcast_category_params)
        format.html { redirect_to @podcast_category, notice: 'Podcast category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @podcast_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /podcast_categories/1
  # DELETE /podcast_categories/1.json
  def destroy
    @podcast_category.destroy
    respond_to do |format|
      format.html { redirect_to podcast_categories_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_podcast_category
      @podcast_category = PodcastCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def podcast_category_params
      params.require(:podcast_category).permit(:name)
    end
end
