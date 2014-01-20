class UsersController < ApplicationController
  include SessionsHelper
  before_action :signed_in_user,
                only: [:index, :edit, :update, :destroy, :following, :followers]
  
  def show
  	@user = User.find(params[:id])
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
  
end