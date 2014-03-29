class LocalReviewsController < ApplicationController
  before_action :factual_authorize
  before_action :set_local_review, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [:new]
  before_action :set_local

  def index
    @local_reviews = LocalReview.where(local_id: params[:id])
  end

  def show
  end

  def new
    query = @factual.table('places')
    @local = query.filters('factual_id' => params[:local_id]).first
    @local_review = LocalReview.new
  end

  def edit
  end

  def create
    @local_review = LocalReview.new(local_review_params)
    @local_review.user = current_user

    respond_to do |format|
      if @local_review.save
        format.html { redirect_to local_path(@local['factual_id']), notice: 'Local review was successfully created.' }
        format.json { render action: 'show', status: :created, location: @local_review }
      else
        format.html { render action: 'new' }
        format.json { render json: @local_review.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @local_review.update(local_review_params)
        format.html { redirect_to @local_review, notice: 'Local review was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @local_review.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @local_review.destroy
    respond_to do |format|
      format.html { redirect_to local_reviews_url }
      format.json { head :no_content }
    end
  end

  private
  
    def set_local
      query = @factual.table('places')
      @local = query.filters('factual_id' => params[:local_id]).first
    end

    def set_local_review
      @local_review = LocalReview.find(params[:id])
    end

    def local_review_params
      params.require(:local_review).permit(:user_id, :local_id, :title, :content)
    end
  
    def factual_authorize
      @factual = Factual.new("eXMwUZMBIrfW7ORstKjqxoZelkYRMmOwi6C7lRDt", "htInMeU5AXUHdPuErx27W1MIj9MYeYzsG6DhhSV6")
    end
  
end

