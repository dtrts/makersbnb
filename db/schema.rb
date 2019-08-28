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

# Active Records Schema allows programmers to programmatically define a schema
# in a portable DSL (domain specific language). This means you can define tables, indexes, etc.
# without using SQL directly, so your applications can more easily support multiple databases.
ActiveRecord::Schema.define(version: 0) do
  # These are extensions that must be enabled in order to support this database.
  # This enables a programming language that allows user to do complex operations.
  # This is included with postgres
  enable_extension 'plpgsql'

  # Active record commands to create the database in psql.
  create_table 'listings', id: :serial, force: :cascade do |t|
    t.string 'name', limit: 255
    t.string 'description', limit: 3500
    t.money 'price_per_night', scale: 2
    t.date 'start_date'
    t.date 'end_date'
    t.timestamps
  end

  create_table 'users', id: :serial, force: :cascade do |t|
    t.string 'username', limit: 255
    t.string 'password_hash', limit: 255
    t.string 'name', limit: 255
    t.string 'email', limit: 255
    t.string 'telephone', limit: 255
    t.timestamps
  end
end
