class LocalPromotion < ActiveRecord::Base
  
  belongs_to :local_votes

  before_save :promotion_count_checking

  def promotion_count_checking
    vote = LocalVote.find_by_id vote_id
    vote.live_vote?
  end
  
end  