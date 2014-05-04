class UsersController < ApplicationController
  include SessionsHelper
  before_action :signed_in_user,
                only: [:index, :edit, :update, :destroy, :following, :followers]
  
  def show
  	@user = User.find(params[:id])
    
    @activities = PublicActivity::Activity.order("created_at desc").where(owner_id: @user, owner_type: "User")
    
  end
  
  def index
    @users = User.all
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update 
    @user = User.find(params[:id])
 
    if @user.update(user_params)
        redirect_to @user
      else
        render 'edit'
      end
  end
  
  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers
    render 'show_follow'
  end
  
  private

    def user_params
      params.require(:user).permit(:admin, :banned, :moderator)
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