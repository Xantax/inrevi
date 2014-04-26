module PointsHelper  
  
  def auto_review_creator
    User.find_by_id(auto_review.user_id)
  end
  
  def followed_user
    User.find(params[:relationship][:followed_id])
  end
  
end