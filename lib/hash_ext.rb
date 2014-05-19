class Hash
  def local_comments
    LocalReview.find_all_by_local_id self['factual_id'] rescue nil
  end

  def local_comments_count
    local_comments.count
  end
end