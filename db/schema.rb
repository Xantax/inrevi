# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140327225506) do

  create_table "auto_reviews", force: true do |t|
    t.integer  "user_id"
    t.integer  "auto_id"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "auto_reviews", ["auto_id"], name: "index_auto_reviews_on_auto_id"
  add_index "auto_reviews", ["user_id"], name: "index_auto_reviews_on_user_id"

  create_table "autos", force: true do |t|
    t.string   "name"
    t.string   "engine"
    t.string   "transmission"
    t.string   "horsepower"
    t.string   "fueleconomy"
    t.string   "navigation"
    t.string   "bodytype"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "drug_reviews", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.integer  "drug_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "drug_reviews", ["drug_id"], name: "index_drug_reviews_on_drug_id"
  add_index "drug_reviews", ["user_id"], name: "index_drug_reviews_on_user_id"

  create_table "drugs", force: true do |t|
    t.string   "name"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "local_reviews", force: true do |t|
    t.integer  "user_id"
    t.integer  "factual_id"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "local_reviews", ["factual_id"], name: "index_local_reviews_on_factual_id"
  add_index "local_reviews", ["user_id"], name: "index_local_reviews_on_user_id"

  create_table "locals", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "movie_reviews", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "movie_id"
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
  end

  add_index "movie_reviews", ["movie_id"], name: "index_movie_reviews_on_movie_id"
  add_index "movie_reviews", ["user_id"], name: "index_movie_reviews_on_user_id"

  create_table "movies", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "podcast_languages", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "podcast_reviews", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "podcast_id"
    t.integer  "user_id"
  end

  add_index "podcast_reviews", ["podcast_id"], name: "index_podcast_reviews_on_podcast_id"
  add_index "podcast_reviews", ["user_id"], name: "index_podcast_reviews_on_user_id"

  create_table "podcasts", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "website"
    t.integer  "podcast_language_id"
    t.string   "image"
  end

  add_index "podcasts", ["podcast_language_id"], name: "index_podcasts_on_podcast_language_id"

  create_table "promotions", force: true do |t|
    t.integer  "vote_id"
    t.string   "place"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relationships", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "songs", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true

  create_table "tags", force: true do |t|
    t.string "name"
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true

  create_table "tech_reviews", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.integer  "tech_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tech_reviews", ["tech_id"], name: "index_tech_reviews_on_tech_id"
  add_index "tech_reviews", ["user_id"], name: "index_tech_reviews_on_user_id"

  create_table "teches", force: true do |t|
    t.string   "name"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
  end

  create_table "tvshow_reviews", force: true do |t|
    t.integer  "tvshow_id"
    t.integer  "user_id"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tvshow_reviews", ["tvshow_id"], name: "index_tvshow_reviews_on_tvshow_id"
  add_index "tvshow_reviews", ["user_id"], name: "index_tvshow_reviews_on_user_id"

  create_table "tvshows", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
  end

  create_table "votes", force: true do |t|
    t.string   "factual_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "query"
    t.string   "place"
  end

end
