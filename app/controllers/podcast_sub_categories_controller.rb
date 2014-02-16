class PodcastSubCategoriesController < ApplicationController
  before_action :set_podcast_sub_category, only: [:show, :edit, :update, :destroy]

  # GET /podcast_sub_categories
  # GET /podcast_sub_categories.json
  def index
    @podcast_sub_categories = PodcastSubCategory.all
  end

  # GET /podcast_sub_categories/1
  # GET /podcast_sub_categories/1.json
  def show
  end

  # GET /podcast_sub_categories/new
  def new
    @podcast_sub_category = PodcastSubCategory.new
    @podcast_categories = PodcastCategory.all
  end

  # GET /podcast_sub_categories/1/edit
  def edit
    @podcast_categories = PodcastCategory.all
  end

  # POST /podcast_sub_categories
  # POST /podcast_sub_categories.json
  def create
    @podcast_sub_category = PodcastSubCategory.new(podcast_sub_category_params)

    respond_to do |format|
      if @podcast_sub_category.save
        format.html { redirect_to @podcast_sub_category, notice: 'Podcast sub category was successfully created.' }
        format.json { render action: 'show', status: :created, location: @podcast_sub_category }
      else
        format.html { render action: 'new' }
        format.json { render json: @podcast_sub_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /podcast_sub_categories/1
  # PATCH/PUT /podcast_sub_categories/1.json
  def update
    respond_to do |format|
      if @podcast_sub_category.update(podcast_sub_category_params)
        format.html { redirect_to @podcast_sub_category, notice: 'Podcast sub category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @podcast_sub_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /podcast_sub_categories/1
  # DELETE /podcast_sub_categories/1.json
  def destroy
    @podcast_sub_category.destroy
    respond_to do |format|
      format.html { redirect_to podcast_sub_categories_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_podcast_sub_category
      @podcast_sub_category = PodcastSubCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def podcast_sub_category_params
      params.require(:podcast_sub_category).permit(:name, :podcast_category_id)
    end
end
