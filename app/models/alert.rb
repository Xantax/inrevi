class Alert < ActiveRecord::Base
  include PublicActivity::Common
  
  belongs_to :user, :counter_cache => true
  
    validate :user_quota, :on => :create
  
  def user_quota
    if user.alerts.today.count >= 2
      errors.add(:base, "You can't create more today!")
    end
  end
  
end
