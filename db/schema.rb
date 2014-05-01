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

ActiveRecord::Schema.define(version: 20140501005741) do

  create_table "activities", force: true do |t|
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "key"
    t.text     "parameters"
    t.integer  "recipient_id"
    t.string   "recipient_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type"
  add_index "activities", ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type"
  add_index "activities", ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type"

  create_table "auto_reviews", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "point",                 default: -1
    t.integer  "user_id"
    t.integer  "auto_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cached_votes_total",    default: 0
    t.integer  "cached_votes_score",    default: 0
    t.integer  "cached_votes_up",       default: 0
    t.integer  "cached_votes_down",     default: 0
    t.integer  "cached_weighted_score", default: 0
  end

  add_index "auto_reviews", ["auto_id"], name: "index_auto_reviews_on_auto_id"
  add_index "auto_reviews", ["cached_votes_down"], name: "index_auto_reviews_on_cached_votes_down"
  add_index "auto_reviews", ["cached_votes_score"], name: "index_auto_reviews_on_cached_votes_score"
  add_index "auto_reviews", ["cached_votes_total"], name: "index_auto_reviews_on_cached_votes_total"
  add_index "auto_reviews", ["cached_votes_up"], name: "index_auto_reviews_on_cached_votes_up"
  add_index "auto_reviews", ["cached_weighted_score"], name: "index_auto_reviews_on_cached_weighted_score"
  add_index "auto_reviews", ["user_id"], name: "index_auto_reviews_on_user_id"

  create_table "autos", force: true do |t|
    t.string   "name"
    t.string   "image"
    t.text     "additionalinfo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "badges_sashes", force: true do |t|
    t.integer  "badge_id"
    t.integer  "sash_id"
    t.boolean  "notified_user", default: false
    t.datetime "created_at"
  end

  add_index "badges_sashes", ["badge_id", "sash_id"], name: "index_badges_sashes_on_badge_id_and_sash_id"
  add_index "badges_sashes", ["badge_id"], name: "index_badges_sashes_on_badge_id"
  add_index "badges_sashes", ["sash_id"], name: "index_badges_sashes_on_sash_id"

  create_table "books", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contact_forms", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "category"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "drugs", force: true do |t|
    t.string   "name"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "links", force: true do |t|
    t.string   "link"
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "local_promotions", force: true do |t|
    t.integer  "local_vote_id"
    t.string   "place"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "local_reviews", force: true do |t|
    t.integer  "user_id"
    t.integer  "local_id"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "local_reviews", ["local_id"], name: "index_local_reviews_on_local_id"
  add_index "local_reviews", ["user_id"], name: "index_local_reviews_on_user_id"

  create_table "local_votes", force: true do |t|
    t.string   "factual_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "query"
    t.string   "place"
  end

  create_table "locals", force: true do |t|
    t.integer  "factual_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merit_actions", force: true do |t|
    t.integer  "user_id"
    t.string   "action_method"
    t.integer  "action_value"
    t.boolean  "had_errors",    default: false
    t.string   "target_model"
    t.integer  "target_id"
    t.boolean  "processed",     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merit_activity_logs", force: true do |t|
    t.integer  "action_id"
    t.string   "related_change_type"
    t.integer  "related_change_id"
    t.string   "description"
    t.datetime "created_at"
  end

  create_table "merit_score_points", force: true do |t|
    t.integer  "score_id"
    t.integer  "num_points", default: 0
    t.string   "log"
    t.datetime "created_at"
  end

  create_table "merit_scores", force: true do |t|
    t.integer "sash_id"
    t.string  "category", default: "default"
  end

  create_table "movies", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "podcasts", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "website"
    t.string   "image"
  end

  create_table "promotions", force: true do |t|
    t.string   "text"
    t.string   "link"
    t.boolean  "local"
    t.boolean  "auto"
    t.boolean  "tech"
    t.boolean  "book"
    t.boolean  "movie"
    t.boolean  "music"
    t.boolean  "podcast"
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

  create_table "review_images", force: true do |t|
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "review_images", ["attachable_id", "attachable_type"], name: "index_review_images_on_attachable_id_and_attachable_type"

  create_table "sashes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  create_table "teches", force: true do |t|
    t.string   "name"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
  end

  create_table "tvshows", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "image"
    t.string   "email"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sash_id"
    t.integer  "level",            default: 0
  end

  create_table "votes", force: true do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"

end
