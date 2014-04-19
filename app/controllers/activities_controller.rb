class ActivitiesController < ApplicationController
  def index
    @activities = PublicActivity::Activity.order("created_at desc").where(owner_id: current_user.followed_user_ids, owner_type: "User")
  end
  
  def show
    @activities = PublicActivity::Activity.order("created_at desc").where(owner_id: current_user, owner_type: "User")
  end
end
