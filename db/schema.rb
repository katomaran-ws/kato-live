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

ActiveRecord::Schema.define(version: 20160716101817) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.integer  "most_read_count"
    t.integer  "rating"
    t.integer  "sequence_number"
    t.integer  "updated_by"
    t.integer  "created_by"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
