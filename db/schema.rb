# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_04_24_031922) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookmarks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "bookmarkable_type", null: false
    t.bigint "bookmarkable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bookmarkable_type", "bookmarkable_id"], name: "index_bookmarks_on_bookmarkable"
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "buddies", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "buddy_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["buddy_id"], name: "index_buddies_on_buddy_id"
    t.index ["user_id"], name: "index_buddies_on_user_id"
  end

  create_table "collection_items", force: :cascade do |t|
    t.bigint "collection_id", null: false
    t.string "collectable_type", null: false
    t.bigint "collectable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["collectable_type", "collectable_id"], name: "index_collection_items_on_collectable"
    t.index ["collection_id"], name: "index_collection_items_on_collection_id"
  end

  create_table "collections", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name", limit: 25, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_collections_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "post_id", null: false
    t.bigint "user_id", null: false
    t.string "body", limit: 255, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_spoiler", default: false, null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "communities", force: :cascade do |t|
    t.string "name", limit: 20, null: false
    t.string "description", limit: 255, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_communities_on_name", unique: true
  end

  create_table "community_members", force: :cascade do |t|
    t.bigint "community_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["community_id"], name: "index_community_members_on_community_id"
    t.index ["user_id"], name: "index_community_members_on_user_id"
  end

  create_table "downvotes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "downvoteable_type", null: false
    t.bigint "downvoteable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["downvoteable_type", "downvoteable_id"], name: "index_downvotes_on_downvoteable"
    t.index ["user_id"], name: "index_downvotes_on_user_id"
  end

  create_table "feature_toggles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name", limit: 50, null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_feature_toggles_on_name", unique: true
    t.index ["user_id"], name: "index_feature_toggles_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "community_id", null: false
    t.bigint "user_id", null: false
    t.string "body", limit: 255, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_spoiler", default: false, null: false
    t.index ["community_id"], name: "index_posts_on_community_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "replies", force: :cascade do |t|
    t.bigint "comment_id", null: false
    t.bigint "user_id", null: false
    t.string "body", limit: 255, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_spoiler", default: false, null: false
    t.index ["comment_id"], name: "index_replies_on_comment_id"
    t.index ["user_id"], name: "index_replies_on_user_id"
  end

  create_table "upvotes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "upvoteable_type", null: false
    t.bigint "upvoteable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["upvoteable_type", "upvoteable_id"], name: "index_upvotes_on_upvoteable"
    t.index ["user_id"], name: "index_upvotes_on_user_id"
  end

  create_table "username_histories", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "username", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_username_histories_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", limit: 15, null: false
    t.string "password_digest", limit: 60, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "role", default: 0, null: false
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "visitors", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "visitable_type", null: false
    t.bigint "visitable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_visitors_on_user_id"
    t.index ["visitable_type", "visitable_id"], name: "index_visitors_on_visitable"
  end

  add_foreign_key "bookmarks", "users"
  add_foreign_key "buddies", "users"
  add_foreign_key "buddies", "users", column: "buddy_id"
  add_foreign_key "collection_items", "collections"
  add_foreign_key "collections", "users"
  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "community_members", "communities"
  add_foreign_key "community_members", "users"
  add_foreign_key "downvotes", "users"
  add_foreign_key "feature_toggles", "users"
  add_foreign_key "posts", "communities"
  add_foreign_key "posts", "users"
  add_foreign_key "replies", "comments"
  add_foreign_key "replies", "users"
  add_foreign_key "upvotes", "users"
  add_foreign_key "username_histories", "users"
  add_foreign_key "visitors", "users"
end
