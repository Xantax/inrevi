class RecipeReview < ActiveRecord::Base
 include PublicActivity::Common
# tracked owner: ->(controller, model) { controller && controller.current_user }
  attr_accessor :image, :file
  
  acts_as_votable
    
  belongs_to :user
  belongs_to :recipe
  
  validate :user_quota, :on => :create  
  
  has_many :review_images, :as => :attachable, :dependent => :destroy
  accepts_nested_attributes_for :review_images, :limit => 3
  
  validates :user_id, presence: true
  validates :recipe_id, presence: true
  validates :title, presence: true, length: { maximum: 50}
  validates :content, presence: true, length: { maximum: 5000, minimum: 140 }
  
  validates_numericality_of :point, greater_than_or_equal_to: 0
 
  def user_quota
    if user.recipe_reviews.today.count >= 20
      errors.add(:base, "Exceeds daily limit. You can only create 20 reviews/day")
    end
  end 
  
end