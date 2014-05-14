class User < ActiveRecord::Base
  has_merit

  after_create :follow_fbfriends!
  
  acts_as_voter
  
  #---  CUSTOM  ---#
  
  has_many :autos do
    def today
      where(:created_at => (Time.now.beginning_of_day..Time.now))
    end
  end

  has_many :teches do
    def today
      where(:created_at => (Time.now.beginning_of_day..Time.now))
    end
  end

  has_many :podcasts do
    def today
      where(:created_at => (Time.now.beginning_of_day..Time.now))
    end
  end

  has_many :drugs do
    def today
      where(:created_at => (Time.now.beginning_of_day..Time.now))
    end
  end

  
  #---  REVIEWS  ---#
  
  has_many :local_reviews do
    def today
      where(:created_at => (Time.now.beginning_of_day..Time.now))
    end
  end
  
  has_many :auto_reviews do
    def today
      where(:created_at => (Time.now.beginning_of_day..Time.now))
    end
  end
  has_many :movie_reviews do
    def today
      where(:created_at => (Time.now.beginning_of_day..Time.now))
    end
  end
  
  has_many :tvshow_reviews do
    def today
      where(:created_at => (Time.now.beginning_of_day..Time.now))
    end
  end
  
  has_many :podcast_reviews do
    def today
      where(:created_at => (Time.now.beginning_of_day..Time.now))
    end
  end
  
  has_many :tech_reviews do
    def today
      where(:created_at => (Time.now.beginning_of_day..Time.now))
    end
  end
  
  has_many :song_reviews do
    def today
      where(:created_at => (Time.now.beginning_of_day..Time.now))
    end
  end
  
  has_many :book_reviews do
    def today
      where(:created_at => (Time.now.beginning_of_day..Time.now))
    end
  end
  
  
  #---  END OF REVIEWS  ---#
  
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
        user.email = auth.info.email
        user.image = auth.info.image
        user.oauth_token = auth.credentials.token
        user.oauth_expires_at = Time.at(auth.credentials.expires_at)
        user.save!
       end
  end
  
   def facebook
    @facebook ||= Koala::Facebook::API.new(oauth_token)
    block_given? ? yield(@facebook) : @facebook
    rescue Koala::Facebook::APIError => e
    logger.info e.to_s
    nil # or consider a custom null object
   end 
  

    def fbfriends
     @graph = Koala::Facebook::API.new(oauth_token)
        begin
          @fbfriends = @graph.get_connections("me", "friends", fields: "id")
          @uids = @fbfriends.map{ |v| v.values }.flatten
        rescue Koala::Facebook::AuthenticationError => e
          redirect_to '/auth/facebook'
        end
          @friends = User.where(uid: @uids)
    end
  
  def fb_user_id
    self.fbfriends.map{ |v| v.id }
  end
  
  def follow_fbfriends!
      relationships.create!(followed_id: fb_user_id)
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
