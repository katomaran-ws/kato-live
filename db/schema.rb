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

ActiveRecord::Schema.define(version: 20161011080217) do

  create_table "article_contents", force: :cascade do |t|
    t.integer  "article_id"
    t.text     "content"
    t.string   "meta_keywords"
    t.string   "meta_description"
    t.string   "page_title"
    t.string   "banner_image_url"
    t.integer  "updated_by"
    t.integer  "created_by"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "alias_url"
    t.boolean  "status"
    t.string   "article_type"
    t.string   "heading_block"
    t.string   "author"
    t.integer  "most_read_count"
    t.integer  "rating"
    t.integer  "sequence_number"
    t.integer  "updated_by"
    t.integer  "created_by"
    t.datetime "display_date"
    t.integer  "category_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "articles_tags", id: false, force: :cascade do |t|
    t.integer "article_id"
    t.integer "tag_id"
  end

  create_table "assets", force: :cascade do |t|
    t.string   "title"
    t.string   "alias_name"
    t.string   "caption"
    t.boolean  "status",          default: true
    t.string   "access"
    t.integer  "access_code"
    t.string   "location"
    t.integer  "sequence_number"
    t.string   "asset_type"
    t.string   "is_cloudinary"
    t.integer  "gallery_id"
    t.string   "cloudinary_url"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "full_name"
    t.string   "alias_name"
    t.integer  "sequence_number"
    t.boolean  "status",          default: true
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "galleries", force: :cascade do |t|
    t.string   "name"
    t.string   "caption"
    t.string   "description"
    t.boolean  "status"
    t.integer  "title_image_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "newsletters", force: :cascade do |t|
    t.string   "name"
    t.string   "subject"
    t.string   "from_email"
    t.boolean  "status",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "newsletters_subscribers", id: false, force: :cascade do |t|
    t.integer "newsletter_id"
    t.integer "subscriber_id"
  end

  create_table "reports", force: :cascade do |t|
    t.string   "name_of_model"
    t.string   "downloadable_fields", default: ""
    t.boolean  "status",              default: true
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "subscribers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password"
    t.string   "username"
    t.string   "phone"
    t.boolean  "active",              default: true
    t.string   "status"
    t.string   "reset_password_code"
    t.datetime "reset_code_until"
    t.datetime "last_login"
    t.string   "remember_me_key"
    t.string   "remember_me_until"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.string   "alias_name"
    t.boolean  "status",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

end
