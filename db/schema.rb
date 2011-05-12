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

ActiveRecord::Schema.define(:version => 20110512074046) do

  create_table "completed_lines", :force => true do |t|
    t.integer "request_id"
    t.integer "source_id"
    t.integer "lineno"
    t.float   "duration"
    t.float   "view"
    t.float   "db"
    t.integer "status"
    t.string  "url"
  end

  create_table "processing_lines", :force => true do |t|
    t.integer  "request_id"
    t.integer  "source_id"
    t.integer  "lineno"
    t.string   "controller"
    t.string   "action"
    t.string   "format"
    t.string   "ip"
    t.datetime "timestamp"
    t.string   "method"
  end

  create_table "requests", :force => true do |t|
    t.integer "first_lineno"
    t.integer "last_lineno"
  end

  create_table "sources", :force => true do |t|
    t.string   "filename"
    t.datetime "mtime"
    t.integer  "filesize"
  end

end
