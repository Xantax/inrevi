class StaticPagesController < ApplicationController
  before_action :set_activities, only: [:home, :catmedia, :cathome, :catbeauty, :cathobbies, :cathealth, :catfashion, 
    :catelectronics, :catfashion_clothing, :catfashion_footwear, :catsustenance, :mobile_newsfeed]
  before_action :signed_in_user, only: [:admin_dashboard]
  
  def home
    @alert = Alert.new
  end
  
  def scoreboard
    @users = User.paginate(:page => params[:page], :per_page => 20).order("last_sign_in_at DESC")
  end
  
  def tos
  end
  
  def policy
  end
  
  def catmedia
  end
  
  def cathome
  end
  
  def catbeauty
  end
  
  def cathobbies
  end
  
  def cathealth
  end
  
  def catelectronics
  end
  
  def catfashion
  end
  
  def catfashion_clothing
  end
  
  def catfashion_footwear
  end
  
  def catsustenance
  end
  
  def mobile_newsfeed
  end
  
  private
  
  def set_activities
    if signed_in?
      @popular_users = User.popular_users.map(&:id)
      @popular_activities = PublicActivity::Activity.order("created_at desc").where(owner_id: @popular_users, owner_type: "User").limit(10)
  
      @activities = PublicActivity::Activity.paginate(:page => params[:page], :per_page => 15).order("created_at desc").where(owner_id: current_user.followed_user_ids, owner_type: "User")    
    end
  end
  
end
