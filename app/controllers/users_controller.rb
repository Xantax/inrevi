class UsersController < ApplicationController
  include SessionsHelper
  before_action :signed_in_user,
                only: [:index, :edit, :update, :destroy, :following, :followers]
  
  def show
  	@user = User.find(params[:id])
    @podcast_reviews = PodcastReview.where("user_id = ?", @user.id)
    @auto_reviews = AutoReview.where("user_id = ?", @user.id)
  end
  
  def index
    @users = User.all
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
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    # Before filters

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end