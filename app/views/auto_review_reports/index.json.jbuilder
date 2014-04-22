json.array!(@auto_review_reports) do |auto_review_report|
  json.extract! auto_review_report, :id, :content, :user_id, :auto_review_id
  json.url auto_review_report_url(auto_review_report, format: :json)
end
