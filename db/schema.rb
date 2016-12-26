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

ActiveRecord::Schema.define(version: 20161226053032) do

  create_table "articles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "title",       limit: 65535, null: false
    t.text     "body",        limit: 65535, null: false
    t.string   "image"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "user_id"
    t.integer  "likes_count"
    t.index ["user_id"], name: "index_articles_on_user_id", using: :btree
  end

  create_table "favorite_articles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_favorite_articles_on_article_id", using: :btree
    t.index ["user_id"], name: "index_favorite_articles_on_user_id", using: :btree
  end

  create_table "locations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "areaName"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.integer  "children_count"
    t.index ["depth"], name: "index_locations_on_depth", using: :btree
    t.index ["lft"], name: "index_locations_on_lft", using: :btree
    t.index ["parent_id"], name: "index_locations_on_parent_id", using: :btree
    t.index ["rgt"], name: "index_locations_on_rgt", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "nickname"
    t.string   "avater"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "articles", "users"
  add_foreign_key "favorite_articles", "articles"
  add_foreign_key "favorite_articles", "users"
end
