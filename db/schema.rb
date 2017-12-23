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

ActiveRecord::Schema.define(version: 20171220234246) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "lanes", force: :cascade do |t|
    t.string "name"
    t.bigint "pool_id"
    t.index ["pool_id"], name: "index_lanes_on_pool_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.string "slug", null: false
  end

  create_table "pools", force: :cascade do |t|
    t.string "name"
    t.bigint "organization_id"
    t.index ["organization_id"], name: "index_pools_on_organization_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "public_label"
    t.string "nickname"
    t.string "email", default: "", null: false
    t.string "slug", null: false
    t.bigint "organization_id"
    t.bigint "pool_id"
    t.bigint "lane_id"
    t.index ["lane_id"], name: "index_tickets_on_lane_id"
    t.index ["organization_id"], name: "index_tickets_on_organization_id"
    t.index ["pool_id"], name: "index_tickets_on_pool_id"
  end

  create_table "users", force: :cascade do |t|
    t.bigint "organization_id"
    t.string "role"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["organization_id"], name: "index_users_on_organization_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
