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

ActiveRecord::Schema.define(version: 20140531001036) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  add_index "activities", ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type", using: :btree
  add_index "activities", ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type", using: :btree
  add_index "activities", ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type", using: :btree

  create_table "auto_reviews", force: true do |t|
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

  add_index "auto_reviews", ["auto_id"], name: "index_auto_reviews_on_auto_id", using: :btree
  add_index "auto_reviews", ["cached_votes_down"], name: "index_auto_reviews_on_cached_votes_down", using: :btree
  add_index "auto_reviews", ["cached_votes_score"], name: "index_auto_reviews_on_cached_votes_score", using: :btree
  add_index "auto_reviews", ["cached_votes_total"], name: "index_auto_reviews_on_cached_votes_total", using: :btree
  add_index "auto_reviews", ["cached_votes_up"], name: "index_auto_reviews_on_cached_votes_up", using: :btree
  add_index "auto_reviews", ["cached_weighted_score"], name: "index_auto_reviews_on_cached_weighted_score", using: :btree
  add_index "auto_reviews", ["user_id"], name: "index_auto_reviews_on_user_id", using: :btree

  create_table "autos", force: true do |t|
    t.string   "name"
    t.string   "image"
    t.text     "additionalinfo"
    t.string   "category"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "autos", ["user_id"], name: "index_autos_on_user_id", using: :btree

  create_table "badges_sashes", force: true do |t|
    t.integer  "badge_id"
    t.integer  "sash_id"
    t.boolean  "notified_user", default: false
    t.datetime "created_at"
  end

  add_index "badges_sashes", ["badge_id", "sash_id"], name: "index_badges_sashes_on_badge_id_and_sash_id", using: :btree
  add_index "badges_sashes", ["badge_id"], name: "index_badges_sashes_on_badge_id", using: :btree
  add_index "badges_sashes", ["sash_id"], name: "index_badges_sashes_on_sash_id", using: :btree

  create_table "book_reviews", force: true do |t|
    t.text     "content"
    t.integer  "point",                 default: -1
    t.string   "book_name"
    t.string   "book_authors"
    t.string   "book_pages"
    t.string   "book_date"
    t.string   "book_image"
    t.string   "book_language"
    t.integer  "user_id"
    t.string   "book_id"
    t.string   "isbn_10"
    t.string   "isbn_13"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cached_votes_total",    default: 0
    t.integer  "cached_votes_score",    default: 0
    t.integer  "cached_votes_up",       default: 0
    t.integer  "cached_votes_down",     default: 0
    t.integer  "cached_weighted_score", default: 0
  end

  add_index "book_reviews", ["cached_votes_down"], name: "index_book_reviews_on_cached_votes_down", using: :btree
  add_index "book_reviews", ["cached_votes_score"], name: "index_book_reviews_on_cached_votes_score", using: :btree
  add_index "book_reviews", ["cached_votes_total"], name: "index_book_reviews_on_cached_votes_total", using: :btree
  add_index "book_reviews", ["cached_votes_up"], name: "index_book_reviews_on_cached_votes_up", using: :btree
  add_index "book_reviews", ["cached_weighted_score"], name: "index_book_reviews_on_cached_weighted_score", using: :btree
  add_index "book_reviews", ["user_id"], name: "index_book_reviews_on_user_id", using: :btree

  create_table "books", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contact_forms", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "category"
    t.text     "message"
    t.boolean  "read"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contact_forms", ["user_id"], name: "index_contact_forms_on_user_id", using: :btree

  create_table "drug_reviews", force: true do |t|
    t.text     "content"
    t.integer  "point",                 default: -1
    t.integer  "user_id"
    t.integer  "drug_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cached_votes_total",    default: 0
    t.integer  "cached_votes_score",    default: 0
    t.integer  "cached_votes_up",       default: 0
    t.integer  "cached_votes_down",     default: 0
    t.integer  "cached_weighted_score", default: 0
  end

  add_index "drug_reviews", ["cached_votes_down"], name: "index_drug_reviews_on_cached_votes_down", using: :btree
  add_index "drug_reviews", ["cached_votes_score"], name: "index_drug_reviews_on_cached_votes_score", using: :btree
  add_index "drug_reviews", ["cached_votes_total"], name: "index_drug_reviews_on_cached_votes_total", using: :btree
  add_index "drug_reviews", ["cached_votes_up"], name: "index_drug_reviews_on_cached_votes_up", using: :btree
  add_index "drug_reviews", ["cached_weighted_score"], name: "index_drug_reviews_on_cached_weighted_score", using: :btree
  add_index "drug_reviews", ["drug_id"], name: "index_drug_reviews_on_drug_id", using: :btree
  add_index "drug_reviews", ["user_id"], name: "index_drug_reviews_on_user_id", using: :btree

  create_table "drugs", force: true do |t|
    t.string   "name"
    t.string   "image"
    t.text     "additionalinfo"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "drugs", ["user_id"], name: "index_drugs_on_user_id", using: :btree

  create_table "fineart_reviews", force: true do |t|
    t.text     "content"
    t.integer  "point",                 default: -1
    t.integer  "user_id"
    t.integer  "fineart_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cached_votes_total",    default: 0
    t.integer  "cached_votes_score",    default: 0
    t.integer  "cached_votes_up",       default: 0
    t.integer  "cached_votes_down",     default: 0
    t.integer  "cached_weighted_score", default: 0
  end

  add_index "fineart_reviews", ["cached_votes_down"], name: "index_fineart_reviews_on_cached_votes_down", using: :btree
  add_index "fineart_reviews", ["cached_votes_score"], name: "index_fineart_reviews_on_cached_votes_score", using: :btree
  add_index "fineart_reviews", ["cached_votes_total"], name: "index_fineart_reviews_on_cached_votes_total", using: :btree
  add_index "fineart_reviews", ["cached_votes_up"], name: "index_fineart_reviews_on_cached_votes_up", using: :btree
  add_index "fineart_reviews", ["cached_weighted_score"], name: "index_fineart_reviews_on_cached_weighted_score", using: :btree
  add_index "fineart_reviews", ["fineart_id"], name: "index_fineart_reviews_on_fineart_id", using: :btree
  add_index "fineart_reviews", ["user_id"], name: "index_fineart_reviews_on_user_id", using: :btree

  create_table "finearts", force: true do |t|
    t.string   "name"
    t.string   "image"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "finearts", ["user_id"], name: "index_finearts_on_user_id", using: :btree

  create_table "links", force: true do |t|
    t.string   "link"
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "local_reviews", force: true do |t|
    t.integer  "user_id"
    t.string   "local_id"
    t.text     "content"
    t.integer  "point",                 default: -1
    t.string   "local_name"
    t.string   "local_address"
    t.string   "local_locality"
    t.string   "local_region"
    t.string   "local_postcode"
    t.string   "local_country"
    t.string   "local_neighborhood"
    t.string   "local_tel"
    t.string   "local_latitude"
    t.string   "local_longitude"
    t.string   "local_category_labels"
    t.string   "local_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cached_votes_total",    default: 0
    t.integer  "cached_votes_score",    default: 0
    t.integer  "cached_votes_up",       default: 0
    t.integer  "cached_votes_down",     default: 0
    t.integer  "cached_weighted_score", default: 0
  end

  add_index "local_reviews", ["cached_votes_down"], name: "index_local_reviews_on_cached_votes_down", using: :btree
  add_index "local_reviews", ["cached_votes_score"], name: "index_local_reviews_on_cached_votes_score", using: :btree
  add_index "local_reviews", ["cached_votes_total"], name: "index_local_reviews_on_cached_votes_total", using: :btree
  add_index "local_reviews", ["cached_votes_up"], name: "index_local_reviews_on_cached_votes_up", using: :btree
  add_index "local_reviews", ["cached_weighted_score"], name: "index_local_reviews_on_cached_weighted_score", using: :btree
  add_index "local_reviews", ["user_id"], name: "index_local_reviews_on_user_id", using: :btree

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

  create_table "movie_reviews", force: true do |t|
    t.text     "content"
    t.integer  "point",                 default: -1
    t.string   "movie_imdb"
    t.string   "movie_title"
    t.string   "movie_runtime"
    t.string   "movie_year"
    t.string   "movie_poster"
    t.integer  "user_id"
    t.string   "movie_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cached_votes_total",    default: 0
    t.integer  "cached_votes_score",    default: 0
    t.integer  "cached_votes_up",       default: 0
    t.integer  "cached_votes_down",     default: 0
    t.integer  "cached_weighted_score", default: 0
  end

  add_index "movie_reviews", ["cached_votes_down"], name: "index_movie_reviews_on_cached_votes_down", using: :btree
  add_index "movie_reviews", ["cached_votes_score"], name: "index_movie_reviews_on_cached_votes_score", using: :btree
  add_index "movie_reviews", ["cached_votes_total"], name: "index_movie_reviews_on_cached_votes_total", using: :btree
  add_index "movie_reviews", ["cached_votes_up"], name: "index_movie_reviews_on_cached_votes_up", using: :btree
  add_index "movie_reviews", ["cached_weighted_score"], name: "index_movie_reviews_on_cached_weighted_score", using: :btree
  add_index "movie_reviews", ["user_id"], name: "index_movie_reviews_on_user_id", using: :btree

  create_table "movies", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pg_search_documents", force: true do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "podcast_reviews", force: true do |t|
    t.text     "content"
    t.integer  "point",                 default: -1
    t.integer  "user_id"
    t.integer  "podcast_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cached_votes_total",    default: 0
    t.integer  "cached_votes_score",    default: 0
    t.integer  "cached_votes_up",       default: 0
    t.integer  "cached_votes_down",     default: 0
    t.integer  "cached_weighted_score", default: 0
  end

  add_index "podcast_reviews", ["cached_votes_down"], name: "index_podcast_reviews_on_cached_votes_down", using: :btree
  add_index "podcast_reviews", ["cached_votes_score"], name: "index_podcast_reviews_on_cached_votes_score", using: :btree
  add_index "podcast_reviews", ["cached_votes_total"], name: "index_podcast_reviews_on_cached_votes_total", using: :btree
  add_index "podcast_reviews", ["cached_votes_up"], name: "index_podcast_reviews_on_cached_votes_up", using: :btree
  add_index "podcast_reviews", ["cached_weighted_score"], name: "index_podcast_reviews_on_cached_weighted_score", using: :btree
  add_index "podcast_reviews", ["podcast_id"], name: "index_podcast_reviews_on_podcast_id", using: :btree
  add_index "podcast_reviews", ["user_id"], name: "index_podcast_reviews_on_user_id", using: :btree

  create_table "podcasts", force: true do |t|
    t.string   "name"
    t.string   "website"
    t.string   "image"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "podcasts", ["user_id"], name: "index_podcasts_on_user_id", using: :btree

  create_table "product_categories", force: true do |t|
    t.string   "name"
    t.integer  "parent_cat_id"
    t.integer  "cat_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_reviews", force: true do |t|
    t.text     "content"
    t.integer  "point",                 default: -1
    t.integer  "user_id"
    t.integer  "cat_id"
    t.string   "productable_id"
    t.string   "productable_type"
    t.integer  "upc_code"
    t.string   "product_name"
    t.string   "gtins"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cached_votes_total",    default: 0
    t.integer  "cached_votes_score",    default: 0
    t.integer  "cached_votes_up",       default: 0
    t.integer  "cached_votes_down",     default: 0
    t.integer  "cached_weighted_score", default: 0
  end

  add_index "product_reviews", ["cached_votes_down"], name: "index_product_reviews_on_cached_votes_down", using: :btree
  add_index "product_reviews", ["cached_votes_score"], name: "index_product_reviews_on_cached_votes_score", using: :btree
  add_index "product_reviews", ["cached_votes_total"], name: "index_product_reviews_on_cached_votes_total", using: :btree
  add_index "product_reviews", ["cached_votes_up"], name: "index_product_reviews_on_cached_votes_up", using: :btree
  add_index "product_reviews", ["cached_weighted_score"], name: "index_product_reviews_on_cached_weighted_score", using: :btree
  add_index "product_reviews", ["user_id"], name: "index_product_reviews_on_user_id", using: :btree

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
    t.boolean  "tvshow"
    t.boolean  "drug"
    t.boolean  "recipe"
    t.boolean  "art"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipe_reviews", force: true do |t|
    t.text     "content"
    t.integer  "point",                 default: -1
    t.integer  "user_id"
    t.integer  "recipe_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cached_votes_total",    default: 0
    t.integer  "cached_votes_score",    default: 0
    t.integer  "cached_votes_up",       default: 0
    t.integer  "cached_votes_down",     default: 0
    t.integer  "cached_weighted_score", default: 0
  end

  add_index "recipe_reviews", ["cached_votes_down"], name: "index_recipe_reviews_on_cached_votes_down", using: :btree
  add_index "recipe_reviews", ["cached_votes_score"], name: "index_recipe_reviews_on_cached_votes_score", using: :btree
  add_index "recipe_reviews", ["cached_votes_total"], name: "index_recipe_reviews_on_cached_votes_total", using: :btree
  add_index "recipe_reviews", ["cached_votes_up"], name: "index_recipe_reviews_on_cached_votes_up", using: :btree
  add_index "recipe_reviews", ["cached_weighted_score"], name: "index_recipe_reviews_on_cached_weighted_score", using: :btree
  add_index "recipe_reviews", ["recipe_id"], name: "index_recipe_reviews_on_recipe_id", using: :btree
  add_index "recipe_reviews", ["user_id"], name: "index_recipe_reviews_on_user_id", using: :btree

  create_table "recipes", force: true do |t|
    t.string   "name"
    t.string   "image"
    t.integer  "user_id"
    t.text     "ingredients"
    t.text     "directions"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "recipes", ["user_id"], name: "index_recipes_on_user_id", using: :btree

  create_table "relationships", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id", using: :btree
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true, using: :btree
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id", using: :btree

  create_table "review_images", force: true do |t|
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "review_images", ["attachable_id", "attachable_type"], name: "index_review_images_on_attachable_id_and_attachable_type", using: :btree

  create_table "sashes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "song_reviews", force: true do |t|
    t.text     "content"
    t.integer  "point",                 default: -1
    t.string   "song_name"
    t.string   "song_artists"
    t.string   "song_album"
    t.string   "song_isrc"
    t.integer  "user_id"
    t.string   "song_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cached_votes_total",    default: 0
    t.integer  "cached_votes_score",    default: 0
    t.integer  "cached_votes_up",       default: 0
    t.integer  "cached_votes_down",     default: 0
    t.integer  "cached_weighted_score", default: 0
  end

  add_index "song_reviews", ["cached_votes_down"], name: "index_song_reviews_on_cached_votes_down", using: :btree
  add_index "song_reviews", ["cached_votes_score"], name: "index_song_reviews_on_cached_votes_score", using: :btree
  add_index "song_reviews", ["cached_votes_total"], name: "index_song_reviews_on_cached_votes_total", using: :btree
  add_index "song_reviews", ["cached_votes_up"], name: "index_song_reviews_on_cached_votes_up", using: :btree
  add_index "song_reviews", ["cached_weighted_score"], name: "index_song_reviews_on_cached_weighted_score", using: :btree
  add_index "song_reviews", ["user_id"], name: "index_song_reviews_on_user_id", using: :btree

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

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree

  create_table "tags", force: true do |t|
    t.string "name"
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "tech_reviews", force: true do |t|
    t.text     "content"
    t.integer  "point",                 default: -1
    t.integer  "user_id"
    t.integer  "tech_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cached_votes_total",    default: 0
    t.integer  "cached_votes_score",    default: 0
    t.integer  "cached_votes_up",       default: 0
    t.integer  "cached_votes_down",     default: 0
    t.integer  "cached_weighted_score", default: 0
  end

  add_index "tech_reviews", ["cached_votes_down"], name: "index_tech_reviews_on_cached_votes_down", using: :btree
  add_index "tech_reviews", ["cached_votes_score"], name: "index_tech_reviews_on_cached_votes_score", using: :btree
  add_index "tech_reviews", ["cached_votes_total"], name: "index_tech_reviews_on_cached_votes_total", using: :btree
  add_index "tech_reviews", ["cached_votes_up"], name: "index_tech_reviews_on_cached_votes_up", using: :btree
  add_index "tech_reviews", ["cached_weighted_score"], name: "index_tech_reviews_on_cached_weighted_score", using: :btree
  add_index "tech_reviews", ["tech_id"], name: "index_tech_reviews_on_tech_id", using: :btree
  add_index "tech_reviews", ["user_id"], name: "index_tech_reviews_on_user_id", using: :btree

  create_table "teches", force: true do |t|
    t.string   "name"
    t.string   "website"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
  end

  add_index "teches", ["user_id"], name: "index_teches_on_user_id", using: :btree

  create_table "tvshow_reviews", force: true do |t|
    t.text     "content"
    t.integer  "point",                 default: -1
    t.string   "tvshow_name"
    t.string   "tvshow_year"
    t.string   "tvshow_poster"
    t.integer  "user_id"
    t.string   "tvshow_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cached_votes_total",    default: 0
    t.integer  "cached_votes_score",    default: 0
    t.integer  "cached_votes_up",       default: 0
    t.integer  "cached_votes_down",     default: 0
    t.integer  "cached_weighted_score", default: 0
  end

  add_index "tvshow_reviews", ["cached_votes_down"], name: "index_tvshow_reviews_on_cached_votes_down", using: :btree
  add_index "tvshow_reviews", ["cached_votes_score"], name: "index_tvshow_reviews_on_cached_votes_score", using: :btree
  add_index "tvshow_reviews", ["cached_votes_total"], name: "index_tvshow_reviews_on_cached_votes_total", using: :btree
  add_index "tvshow_reviews", ["cached_votes_up"], name: "index_tvshow_reviews_on_cached_votes_up", using: :btree
  add_index "tvshow_reviews", ["cached_weighted_score"], name: "index_tvshow_reviews_on_cached_weighted_score", using: :btree
  add_index "tvshow_reviews", ["user_id"], name: "index_tvshow_reviews_on_user_id", using: :btree

  create_table "tvshows", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.boolean  "admin"
    t.boolean  "banned"
    t.boolean  "moderator"
    t.string   "name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "friends"
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

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree

end
