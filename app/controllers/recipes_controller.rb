class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy, :ingredients, :directions]

  def all
    @recipes = Recipe.paginate(:page => params[:page], :per_page => 10).order("created_at DESC")
  end
  
  def index
#    @recipes = Recipe.all
    @search = Auto.search do
      fulltext params[:search]
      paginate(:page => params[:page], :per_page => 10)
    end
    @recipes = @search.results
  end
  
  def search
    @search = Auto.search do
      fulltext params[:search]
      paginate(:page => params[:page], :per_page => 10)
    end
    @recipes = @search.results 
  end 

  def show
    @recipe_review = RecipeReview.new
    @recipe_reviews = Recipe.find(params[:id]).recipe_reviews.paginate(:page => params[:page], :per_page => 10).order("cached_votes_score DESC")
    @avg_score = 0
    @avg_score = @recipe_reviews.inject(0) { |sum, r| sum += r.point }.to_f / @recipe_reviews.count if @recipe_reviews.count > 0
    
    @promotion = Promotion.order("RANDOM()").first   
  end

  def new
    @recipe = Recipe.new
  end

  def edit
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
  end

  def update
      if @recipe.update(recipe_params)
        redirect_to @recipe
      else
        render action: 'edit'
      end
    end
  end

  def destroy
    @recipe.destroy
      redirect_to recipes_url
    end
  end

  private

    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def recipe_params
      params.require(:recipe).permit(:name, :image, :user_id, :ingredients, :directions)
    end
end
