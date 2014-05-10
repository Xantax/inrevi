class CreateLocalReviews < ActiveRecord::Migration
  def change
    create_table :local_reviews do |t|
      t.references :user, index: true
      t.string :local_id, index: true
      t.string :title
      t.text :content
      t.integer :point, default: -1
      t.string :local_name
      t.string :local_address 
      t.string :local_locality 
      t.string :local_region
      t.string :local_postcode 
      t.string :local_country 
      t.string :local_neighborhood
      t.string :local_tel
      t.string :local_latitude 
      t.string :local_longitude 
      t.string :local_category_labels 
      t.string :local_email
      

      t.timestamps
    end
  end
end
