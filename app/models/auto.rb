class Auto < ActiveRecord::Base
include PgSearch
  pg_search_scope :search_by_name, :against => [:name], :using => {
                    :tsearch => {:prefix => true}
                  }
  
  def self.search(search)
   Auto.search_by_name(search)
  end
  
  validates :name, presence: true
  validates :additionalinfo, presence: true
  validates :image, presence: true
#  validates :remote_image_url, presence: true
  
  has_many :auto_reviews
  belongs_to :user
  
    validate :user_quota, :on => :create
  
  validates :user_id, presence: true
  
  mount_uploader :image, ImageUploader
  
  
  def user_quota
    if user.autos.today.count >= 3
      errors.add(:base, "You can't create more today (SPAM prevention)")
    end
  end
  
  def to_param
      "#{id} #{name}".parameterize
  end
  
end
