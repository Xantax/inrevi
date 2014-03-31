class TechesController < ApplicationController
  before_action :set_tech, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [:new]

  def index
    @search = Tech.search do
      fulltext params[:search]
    end

    if params[:ttag]
      @teches = Tech.tagged_with(params[:ttag])
    elsif
      @teches = @search.results
    else
      @teches = Tech.all
    end
  end

  def show
    @reviewable = @tech
    @reviews = @reviewable.reviews
    @review = Review.new
  end

  def new
    @tech = Tech.new
  end

  def edit
  end

  def create
    @tech = Tech.new(tech_params)

    respond_to do |format|
      if @tech.save
        format.html { redirect_to @tech, notice: 'Tech was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tech }
      else
        format.html { render action: 'new' }
        format.json { render json: @tech.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @tech.update(tech_params)
        format.html { redirect_to @tech, notice: 'Tech was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tech.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tech.destroy
    respond_to do |format|
      format.html { redirect_to teches_url }
      format.json { head :no_content }
    end
  end

  private

    def set_tech
      @tech = Tech.find(params[:id])
    end

    def tech_params
      params.require(:tech).permit(:name, :website, :image, :tag_list, :remote_image_url)
    end
end
