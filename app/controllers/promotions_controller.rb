class PromotionsController < ApplicationController
  before_action :set_promotion, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, except: [:show]

  def index
    if current_user.admin?
      @promotions = Promotion.paginate(:page => params[:page], :per_page => 15).order('created_at DESC')
    end
  end

  def show
  end

  def new
    if current_user.admin?
      @promotion = Promotion.new
    end
  end

  def edit
    unless current_user.admin?
      redirect_to root_path
    end
  end

  def create
    @promotion = Promotion.new(promotion_params)

      if @promotion.save
        redirect_to @promotion
      else
        render action: 'new'
      end
  end

  def update
      if @promotion.update(promotion_params)
        redirect_to @promotion
      else
        render action: 'edit'
      end
  end

  def destroy
    @promotion.destroy
      redirect_to promotions_url
  end

  private

    def set_promotion
      @promotion = Promotion.find(params[:id])
    end

    def promotion_params
      params.require(:promotion).permit(:text, :link, :local, :auto, :tech, :book, :movie, :music, :podcast, :tvshow, :drug)
    end

end
