class UsersController < ApplicationController
  include SessionsHelper
  before_action :signed_in_user, except: [:show]
  
  def show
  	@user = User.find(params[:id])
    @activities = PublicActivity::Activity.paginate(:page => params[:page], :per_page => 15).order("created_at desc").where(owner_id: @user, owner_type: "User")
   
  end
  
  def index
    if current_user.admin?
      @users = User.all
    end
  end
  
  def new
    @user = User.new
  end
  
  def edit
    if current_user.admin?
      @user = User.find(params[:id])
    end
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def update 
    if current_user.admin?
        @user = User.find(params[:id])

        if @user.update(user_params)
            redirect_to @user
          else
            render 'edit'
          end
    end
  end
  
  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(:page => params[:page], :per_page => 10)
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(:page => params[:page], :per_page => 10)
    render 'show_follow'
  end
  
  private

    def user_params
      params.require(:user).permit(:admin, :banned, :moderator, :company, :name, :email, :password, :password_confirmation, :remember_me, :image, :provider, :remote_image_url, :unverified_company )
    end

    # Before filters

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to root_url, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end