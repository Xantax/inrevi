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

ActiveRecord::Schema.define(version: 20140225002849) do

  create_table "movie_reviews", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "movie_id"
    t.string   "title"
    t.text     "content"
    t.integer  "now_playing_id"
    t.integer  "user_id"
  end

  add_index "movie_reviews", ["movie_id"], name: "index_movie_reviews_on_movie_id"
  add_index "movie_reviews", ["user_id"], name: "index_movie_reviews_on_user_id"

  create_table "movies", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "podcast_categories", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
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

  create_table "podcast_sub_categories", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "podcast_category_id"
    t.integer  "podcast_id"
  end

  add_index "podcast_sub_categories", ["podcast_category_id"], name: "index_podcast_sub_categories_on_podcast_category_id"
  add_index "podcast_sub_categories", ["podcast_id"], name: "index_podcast_sub_categories_on_podcast_id"

  create_table "podcasts", force: true do |t|
    t.string   "name"
    t.string   "hosts"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "website"
    t.string   "links"
    t.integer  "podcast_category_id"
    t.integer  "podcast_sub_category_id"
    t.integer  "podcast_language_id"
  end

  add_index "podcasts", ["podcast_category_id"], name: "index_podcasts_on_podcast_category_id"
  add_index "podcasts", ["podcast_language_id"], name: "index_podcasts_on_podcast_language_id"
  add_index "podcasts", ["podcast_sub_category_id"], name: "index_podcasts_on_podcast_sub_category_id"

  create_table "relationships", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
