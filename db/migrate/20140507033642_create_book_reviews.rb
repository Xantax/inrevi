class CreateBookReviews < ActiveRecord::Migration
  def change
    create_table :book_reviews do |t|
      t.string :title
      t.text :content
      t.integer :point, default: -1
      t.boolean :published, default: true
      t.string :book_name
      t.string :book_authors
      t.string :book_pages
      t.string :book_image
      t.string :book_language
      t.string :book_isbn
      t.references :user, index: true
      t.string :book_id, index: true

      t.timestamps
    end
  end
end
