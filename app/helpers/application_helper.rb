module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Inrevi"
    if page_title.empty?
      base_title
    else
       "#{base_title} - #{page_title}"
    end
  end
  
  def avg_score_for auto_resource
    ((auto_resource.auto_reviews.inject(0) { |sum, e| sum += e.point }).to_f / auto_resource.auto_reviews.count).round(1) rescue 0
  end
  
  def avg_score_for local_resource
    ((local_resource.local_reviews.inject(0) { |sum, e| sum += e.point }).to_f / local_resource.auto_reviews.count).round(1) rescue 0
  end
  
  def human_number number
    number_to_human number, :format => '%n%u', :units => { :thousand => 'k' }
  end
  
end

