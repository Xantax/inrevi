class RecipeReviewsController < ApplicationController
  before_action :set_recipe_review, only: [:show, :edit, :update, :destroy]

  def index
    @recipe_reviews = RecipeReview.all
  end

  def show
  end

  def new
    @recipe_review = RecipeReview.new
  end

  def edit
  end

  def create
    @recipe_review = RecipeReview.new(recipe_review_params)

    respond_to do |format|
      if @recipe_review.save
        format.html { redirect_to @recipe_review, notice: 'Recipe review was successfully created.' }
        format.json { render action: 'show', status: :created, location: @recipe_review }
      else
        format.html { render action: 'new' }
        format.json { render json: @recipe_review.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @recipe_review.update(recipe_review_params)
        format.html { redirect_to @recipe_review, notice: 'Recipe review was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @recipe_review.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe_review.destroy
    respond_to do |format|
      format.html { redirect_to recipe_reviews_url }
      format.json { head :no_content }
    end
  end

  private

    def set_recipe_review
      @recipe_review = RecipeReview.find(params[:id])
    end

    def recipe_review_params
      params.require(:recipe_review).permit(:title, :content, :user_id, :recipe_id, :point)
    end
end
