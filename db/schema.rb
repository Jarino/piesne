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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130617235614) do

  create_table "favourites", :force => true do |t|
    t.integer  "user_id"
    t.integer  "song_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "first_letters", :force => true do |t|
    t.string   "let"
    t.integer  "count"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "kinds", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "links", :force => true do |t|
    t.string   "link"
    t.text     "description"
    t.integer  "user_id"
    t.integer  "song_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "occurences", :force => true do |t|
    t.integer  "region_id"
    t.integer  "song_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "regions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.text     "coords"
    t.text     "description"
  end

  create_table "regions_songs", :id => false, :force => true do |t|
    t.integer "region_id"
    t.integer "song_id"
  end

  create_table "reports", :force => true do |t|
    t.integer  "report_type"
    t.text     "description"
    t.integer  "song_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.integer  "status",      :default => 1
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "songs", :force => true do |t|
    t.string   "title"
    t.string   "title_norm"
    t.integer  "first_letter_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "kind_id"
    t.integer  "user_id"
  end

  add_index "songs", ["title"], :name => "index_songs_on_title"

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.integer  "verse_id"
    t.integer  "song_id"
    t.integer  "role_id",         :default => 1
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

  create_table "verses", :force => true do |t|
    t.integer  "song_id"
    t.text     "text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  add_index "verses", ["user_id"], :name => "index_verses_on_user_id"

  add_foreign_key "favourites", "songs", :name => "favourites_song_id_fk"
  add_foreign_key "favourites", "users", :name => "favourites_user_id_fk"

  add_foreign_key "links", "songs", :name => "links_song_id_fk"
  add_foreign_key "links", "users", :name => "links_user_id_fk"

  add_foreign_key "occurences", "regions", :name => "occurences_region_id_fk"
  add_foreign_key "occurences", "songs", :name => "occurences_song_id_fk"

  add_foreign_key "songs", "first_letters", :name => "songs_first_letter_id_fk"
  add_foreign_key "songs", "kinds", :name => "songs_kind_id_fk"
  add_foreign_key "songs", "users", :name => "songs_user_id_fk"

  add_foreign_key "verses", "songs", :name => "verses_song_id_fk"
  add_foreign_key "verses", "users", :name => "verses_user_id_fk"

end
