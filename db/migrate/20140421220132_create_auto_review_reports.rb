class CreateAutoReviewReports < ActiveRecord::Migration
  def change
    create_table :auto_review_reports do |t|
      t.text :content
      t.references :user, index: true
      t.references :auto_review, index: true

      t.timestamps
    end
  end
end
