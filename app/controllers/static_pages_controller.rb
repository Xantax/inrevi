class StaticPagesController < ApplicationController
  def home
    if signed_in?

     @popular_users = User.popular_users.map(&:id)
     @popular_activities = PublicActivity::Activity.order("created_at desc").where(owner_id: @popular_users, owner_type: "User").limit(10)

     @activities = PublicActivity::Activity.order("created_at desc").where(owner_id: current_user.followed_user_ids, owner_type: "User")
      
       @link = Link.order("RANDOM()").first
      
    end
  end

  def advertising
  end

  def about
  end
  
  def contact
  end
  
  def careers
  end
  
  def tos
  end
  
  def policy
  end
  
  def admin_dashboard
  end
  
  def catmedia
  end
  
  def cathome
  end
  
  def catbeauty
  end
  
end
