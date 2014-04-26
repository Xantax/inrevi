class Report < ActiveRecord::Base
  belongs_to :user
  belongs_to :reportable, polymorphic: true
  
  validates :content, presence: true, length: { maximum: 1000 }
end
