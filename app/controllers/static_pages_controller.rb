class StaticPagesController < ApplicationController
  def home
    if signed_in?
#      @auto_review  = current_user.auto_reviews.build
#      @feed_items = current_user.feed
    @activities = PublicActivity::Activity.order("created_at desc").where(owner_id: current_user.followed_user_ids, owner_type: "User")
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
  
  def localads
  end
  
  def localplan1
  end
  
  def localplan2
  end
  
  def localplan3
  end
  
  def techads
  end
  
  def techplan1
  end
  
  def techplan2
  end
  
  def techplan3
  end
  
  def autoads
  end
  
  def catmedia
  end
  
  def cathome
  end
  
  def catbeauty
  end
  
end
