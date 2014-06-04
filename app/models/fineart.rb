class Fineart < ActiveRecord::Base
include PgSearch
  pg_search_scope :search_by_name, :against => [:name], :using => {
                    :tsearch => {:prefix => true}
                  }
  
  def self.search(search)
    Fineart.search_by_name(search)
  end
  
  acts_as_taggable
  
  has_many :fineart_reviews
  belongs_to :user
  
    validate :user_quota, :on => :create

  validates :name, presence: true
  validates :tag_list, presence: true
  validates :image, presence: true
#  validates :remote_image_url, presence: true
  
  mount_uploader :image, ImageUploader
  
  
  def user_quota
    if user.finearts.today.count >= 200
      errors.add(:base, "Exceeds daily limit. You can't create more today (SPAM prevention)")
    end
  end 
  
end
