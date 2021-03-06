class ActivitiesController < ApplicationController
  before_action :signed_in_user
  
  def index

     @popular_users = User.popular_users.map(&:id)
     @popular_activities = PublicActivity::Activity.order("created_at desc").where(owner_id: @popular_users, owner_type: "User").limit(15)

     @activities = PublicActivity::Activity.paginate(:page => params[:page], :per_page => 15).order("created_at desc").where(owner_id: current_user.followed_user_ids, owner_type: "User")
    
  end
  
end
