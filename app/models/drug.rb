class Drug < ActiveRecord::Base
include PgSearch
  pg_search_scope :search_by_name, :against => [:name], :using => {
                    :tsearch => {:prefix => true}
                  }
  
  def self.search(search)
   Drug.search_by_name(search)
  end
  
  validates :name, presence: true
  validates :image, presence: true
#  validates :additionalinfo, presence: true
#  validates :remote_image_url, presence: true
  
  has_many :drug_reviews
  belongs_to :user
  
    validate :user_quota, :on => :create
  
  mount_uploader :image, ImageUploader
  
  
  def user_quota
    if user.drugs.today.count >= 200
      errors.add(:base, "You can't create more today (SPAM prevention)")
    end
  end  
  
end
