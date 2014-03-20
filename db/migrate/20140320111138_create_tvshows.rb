class CreateTvshows < ActiveRecord::Migration
  def change
    create_table :tvshows do |t|

      t.timestamps
    end
  end
end
