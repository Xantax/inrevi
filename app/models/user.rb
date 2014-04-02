class User < ActiveRecord::Base

  has_many :reviews
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
  
  def feed
    Review.from_users_followed_by(self)
  end
  
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
    "http://graph.facebook.com/#{self.uid}/picture?type=large"
  end
  
    def normalimage
    "http://graph.facebook.com/#{self.uid}/picture?type=normal"
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
  
end
