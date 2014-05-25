class RecipeReviewsController < ApplicationController
  before_action :set_recipe_review, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :set_recipe, only: [:index, :show, :new, :create, :edit]

  def all
    @all_recipe_reviews = RecipeReview.order("cached_votes_score ASC").paginate(:page => params[:page], :per_page => 10)
  end  
  
  def index
    @recipe_reviews = @recipe.recipe_reviews.order("cached_votes_score DESC").paginate(:page => params[:page], :per_page => 10)
  end

  def show
  end

  def new
    @recipe_review = RecipeReview.new
    @recipe_review.review_images.build 
    @recipe_review.review_images.build 
    @recipe_review.review_images.build 
  end

  def edit
  end

  def create
    @recipe_review = @recipe.recipe_reviews.build(recipe_review_params)
    @recipe_review.user = current_user

      if @recipe_review.save
        @recipe_review.create_activity :create, owner: current_user
        
        redirect_to current_user
      else
        render action: 'new'
      end
  end

  def update
    @recipe_review.review_images.build if @recipe_review.review_images.empty?
    
      if @recipe_review.update(recipe_review_params)
        redirect_to @recipe_review
      else
        render action: 'edit'
      end
  end

  def destroy
    @recipe_review.destroy
      redirect_to recipe_reviews_url
  end
  
  def upvote
    @recipe_review.liked_by current_user
    render nothing: true
  end

  def downvote
    @recipe_review.downvote_from current_user
    render nothing: true
  end

  private
  
    def set_recipe
      @recipe = Recipe.find(params[:recipe_id])
    end

    def set_recipe_review
      @recipe = Recipe.find(params[:recipe_id])
      @recipe_review = @recipe.recipe_reviews.find(params[:id])
    end

    def recipe_review_params
      params.require(:recipe_review).permit(:content, :user_id, :recipe_id, :point, :score, :ingredients, :directions,
        review_images_attributes: [:image, :attachable_id, :attachable_type])
    end
end
