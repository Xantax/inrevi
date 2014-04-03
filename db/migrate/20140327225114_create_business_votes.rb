class CreateBusinessVotes < ActiveRecord::Migration
  def change
    create_table :local_votes do |t|
    t.string   "factual_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "query"
    t.string   "place"

      t.timestamps
    end
  end
end
