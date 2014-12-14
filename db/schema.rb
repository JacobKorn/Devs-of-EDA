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

ActiveRecord::Schema.define(version: 20141214104715) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boards", force: true do |t|
  end

  create_table "players", force: true do |t|
    t.string   "name"
    t.integer  "wood",           default: 0
    t.integer  "sheep",          default: 0
    t.integer  "ore",            default: 0
    t.integer  "grain",          default: 0
    t.integer  "brick",          default: 0
    t.integer  "victory_points", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sites", force: true do |t|
    t.integer  "tile_one_id"
    t.integer  "tile_two_id"
    t.integer  "tile_three_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tile_sites", force: true do |t|
    t.integer  "tile_id"
    t.integer  "site_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tiles", force: true do |t|
    t.integer  "number"
    t.integer  "type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "board_id"
    t.integer  "x"
    t.integer  "y"
    t.integer  "site_0_id"
    t.integer  "site_1_id"
    t.integer  "site_2_id"
    t.integer  "site_3_id"
    t.integer  "site_4_id"
    t.integer  "site_5_id"
    t.string   "tile_type"
  end

end
