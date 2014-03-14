class AddImageToTech < ActiveRecord::Migration
  def change
    add_column :teches, :image, :string
  end
end
