module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = ""
    if page_title.empty?
      base_title
    else
      "#{page_title} #{base_title}"
    end
  end
  
  def avg_score_for resource
    ((resource.auto_reviews.inject(0) { |sum, e| sum += e.point }).to_f / resource.auto_reviews.count).round(1) rescue 0
  end
  
end

