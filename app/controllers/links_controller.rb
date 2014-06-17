class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, except: [:show]

  def index
    if current_user.admin?
      @links = Link.paginate(:page => params[:page], :per_page => 15).order('created_at DESC')
    end
  end

  def show
    unless current_user.admin?
      redirect_to root_path
    end
  end

  def new
    if current_user.admin?
      @link = Link.new
    end
  end

  def edit
    unless current_user.admin?
      redirect_to root_path
    end
  end

  def create
    @link = Link.new(link_params)

      if @link.save
        redirect_to @link
      else
        render action: 'new'
      end
  end

  def update
      if @link.update(link_params)
        redirect_to @link
      else
        render action: 'edit'
      end
  end

  def destroy
    @link.destroy
      redirect_to links_url
  end

  private

    def set_link
      @link = Link.find(params[:id])
    end

    def link_params
      params.require(:link).permit(:link, :text)
    end
end
