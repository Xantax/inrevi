class User < ActiveRecord::Base

  acts_as_voter
  
  #---  REVIEWS  ---#
  
  has_many :local_reviews
  has_many :auto_reviews
  
  #---  END OF REVIEWS  ---#

  
  #---  REPORTS  ---#
  
  has_many :auto_review_reports
  
  #---  END REPORTS  ---#
  
  
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower
  
  def self.from_omniauth(auth)
  where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
    user.provider = auth.provider
    user.uid = auth.uid
    user.name = auth.info.name
    user.first_name = auth.info.first_name
    user.last_name = auth.info.last_name
    user.oauth_token = auth.credentials.token
    user.oauth_expires_at = Time.at(auth.credentials.expires_at)
    user.save!
   end
 end
  
#  def feed
#    Review.from_users_followed_by(self)
#  end
  
  
   def facebook
    @facebook ||= Koala::Facebook::API.new(oauth_token)
    block_given? ? yield(@facebook) : @facebook
    rescue Koala::Facebook::APIError => e
    logger.info e.to_s
    nil # or consider a custom null object
   end 
  
  def smallimage
  "http://graph.facebook.com/#{self.uid}/picture?type=small"
  end
  
  def largeimage
    "http://graph.facebook.com/#{self.uid}/picture?width=130"
  end
  
  def normalimage
    "http://graph.facebook.com/#{self.uid}/picture?width=100"
  end
  
  def reviewimage
    "https://graph.facebook.com/#{self.uid}/picture?width=70"
  end
  
  def following?(other_user)
    relationships.find_by(followed_id: other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end
  
  def unfollow!(other_user)
    relationships.find_by(followed_id: other_user.id).destroy
  end
  
  def self.popular_users
    #SQL statement to find most followed users
    sql_select = "a.id, count(*)"
    sql_from ="users as a inner join relationships as b on a.id = b.followed_id"
    sql_group = "a.id"
    
    User.select(sql_select).from(sql_from).group(sql_group).limit(100)
  end
  
end
