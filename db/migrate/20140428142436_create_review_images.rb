class CreateReviewImages < ActiveRecord::Migration
  def change
    create_table :review_images do |t|
      t.references :attachable, index: true, :polymorphic => true
      t.string :image
      
      t.timestamps
    end
  end
end
