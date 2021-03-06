class CreateBookReviews < ActiveRecord::Migration
  def change
    create_table :book_reviews do |t|
      t.text :content
      t.integer :point, default: -1
      t.string :book_name
      t.string :book_authors
      t.string :book_pages
      t.string :book_date
      t.string :book_image
      t.string :book_language
      t.references :user, index: true
      t.string :book_id, index: true
      t.string :isbn_10
      t.string :isbn_13

      t.timestamps
    end
  end
end
