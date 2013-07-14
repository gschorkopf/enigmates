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

ActiveRecord::Schema.define(:version => 20130714220837) do

  create_table "attempt_users", :force => true do |t|
    t.integer  "user_id"
    t.integer  "attempt_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "attempts", :force => true do |t|
    t.integer  "puzzle_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "mode"
    t.string   "status"
  end

  create_table "authorizations", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "guesses", :force => true do |t|
    t.integer  "piece_id"
    t.integer  "attempt_id"
    t.boolean  "correct",    :default => true
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.integer  "user_id"
  end

  create_table "invites", :force => true do |t|
    t.integer  "puzzle_id"
    t.integer  "attempt_id"
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "messages", :force => true do |t|
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.string   "content"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "pieces", :force => true do |t|
    t.string   "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "puzzle_id"
    t.string   "hint"
  end

  create_table "puzzles", :force => true do |t|
    t.string   "name"
    t.string   "topic"
    t.string   "format"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "image_url"
    t.string   "hint_noun"
    t.string   "content_noun"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
