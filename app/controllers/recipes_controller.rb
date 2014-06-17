class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy, :ingredients, :directions]
  before_action :signed_in_user, except: [:show]

  def all
    if current_user.admin?
      @recipes = Recipe.paginate(:page => params[:page], :per_page => 15).order("created_at DESC")
    end
  end
  
  def index
  end
  
  def search
    @recipes = Recipe.search(params[:search]).paginate(:page => params[:page], :per_page => 15)
  end 

  def show
    @recipe_review = RecipeReview.new
    @recipe_reviews = Recipe.find(params[:id]).recipe_reviews.paginate(:page => params[:page], :per_page => 15).order("cached_votes_score DESC")
    @avg_score = 0
    @avg_score = @recipe_reviews.inject(0) { |sum, r| sum += r.point }.to_f / @recipe_reviews.count if @recipe_reviews.count > 0
    
    @promotion = Promotion.order("RANDOM()").first   
  end

  def new
    @recipe = Recipe.new
  end

  def edit
    unless current_user.admin?
      redirect_to root_path
    end
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user

      if @recipe.save
        redirect_to @recipe
      else
        render action: 'new'
      end
  end

  def update
      if @recipe.update(recipe_params)
        redirect_to @recipe
      else
        render action: 'edit'
      end
  end

  def destroy
    @recipe.destroy
      redirect_to recipes_url
  end

  private

    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def recipe_params
      params.require(:recipe).permit(:name, :image, :user_id, :ingredients, :directions, :tag_list)
    end
end
