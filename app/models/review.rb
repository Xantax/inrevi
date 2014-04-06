class Review < ActiveRecord::Base
    
  belongs_to :reviewable, polymorphic: true
  default_scope -> { order('created_at DESC') }
  belongs_to :user
  
  validates :user_id, presence: true
  validates :title, presence: true
  validates :content, presence: true, length: { maximum: 10000, minimum: 140 }
  
  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
          user_id: user.id)
  end
  
end
