class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook, :google_oauth2, :twitter]
  
  has_merit
  
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
  
  has_many :recipes do
    def today
      where(:created_at => (Time.now.beginning_of_day..Time.now))
    end
  end
  
  has_many :finearts do
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
  
  has_many :recipe_reviews do
    def today
      where(:created_at => (Time.now.beginning_of_day..Time.now))
    end
  end  
  
  has_many :fineart_reviews do
    def today
      where(:created_at => (Time.now.beginning_of_day..Time.now))
    end
  end  
  
  has_many :drug_reviews do
    def today
      where(:created_at => (Time.now.beginning_of_day..Time.now))
    end
  end
  
  has_many :product_reviews do
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
  
  has_many :contact_forms 
  
  has_many :alerts do
    def today
      where(:created_at => (Time.now.beginning_of_day..Time.now))
    end
  end
  
  mount_uploader :image, ImageUploader
  
  
  def self.from_omniauth(auth)
      where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.name = auth.info.name
        user.first_name = auth.info.first_name
        user.last_name = auth.info.last_name
        user.email = auth.info.email
        user.password = auth.uid
        user.password_confirmation = auth.uid
        user.image_auth = auth.info.image
        user.oauth_token = auth.credentials.token
        user.oauth_expires_at = Time.at(auth.credentials.expires_at) unless auth.credentials.expires_at.nil?
        user.save!
       end
  end
  
    def self.new_with_session(params, session)
      if session["devise.user_attributes"]
        new(session["devise.user_attributes"], without_protection: true) do |user|
          user.attributes = params
          user.valid?
        end
      else
        super
      end
    end
  
   def facebook
    @facebook ||= Koala::Facebook::API.new(oauth_token)
    block_given? ? yield(@facebook) : @facebook
    rescue Koala::Facebook::APIError => e
    logger.info e.to_s
    nil # or consider a custom null object
   end 
  
  def following?(other_user)
    relationships.find_by(followed_id: other_user.id)
  end
  
  def not_following?(other_user)
    other_user != self && !following?(other_user)
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
  
  def to_param
      "#{id} #{name}".parameterize
  end
  
end
