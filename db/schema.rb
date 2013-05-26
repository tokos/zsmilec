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

ActiveRecord::Schema.define(:version => 20130526080535) do

  create_table "councils", :primary_key => "ID", :force => true do |t|
    t.string "NAME",       :limit => 20
    t.date   "START_DATE",                :null => false
    t.date   "END_DATE"
    t.string "TASKS",      :limit => 100
    t.string "RESULTS",    :limit => 100
  end

  add_index "councils", ["ID"], :name => "ID", :unique => true

  create_table "days", :primary_key => "ID", :force => true do |t|
    t.string  "NAME",         :limit => 20
    t.integer "POSITION",                   :null => false
    t.integer "TIMETABLE_ID", :limit => 8,  :null => false
  end

  add_index "days", ["ID"], :name => "ID", :unique => true

  create_table "employees", :primary_key => "ID", :force => true do |t|
    t.string  "FIRST_NAME",   :limit => 20, :null => false
    t.string  "LAST_NAME",    :limit => 20, :null => false
    t.string  "ADDRESS",      :limit => 50
    t.string  "PHONE",        :limit => 20
    t.string  "EMAIL",        :limit => 30
    t.date    "ENTRY_DATE",                 :null => false
    t.string  "POSITION",     :limit => 30, :null => false
    t.integer "TEACHER_FLAG",               :null => false
    t.string  "DEGREE",       :limit => 20    
    t.string  "image"
  end

  add_index "employees", ["ID"], :name => "ID", :unique => true

  create_table "events", :primary_key => "ID", :force => true do |t|
    t.date   "EVENT_DATE",                :null => false
    t.time   "EVENT_TIME",                :null => false
    t.string "TEXT",       :limit => 100, :null => false
    t.string "TYPE",       :limit => 3,   :null => false
  end

  add_index "events", ["ID"], :name => "ID", :unique => true

  create_table "hours", :primary_key => "ID", :force => true do |t|
    t.integer "DAY_ID",     :limit => 8,  :null => false
    t.string  "HOUR",       :limit => 20, :null => false
    t.string  "NOTE",       :limit => 45
    t.integer "POSITION",                 :null => false
    t.integer "SUBJECT_ID", :limit => 8
  end

  add_index "hours", ["DAY_ID"], :name => "HOUR_FK1_idx"
  add_index "hours", ["ID"], :name => "ID_UNIQUE", :unique => true
  add_index "hours", ["SUBJECT_ID"], :name => "HOUR_FK2_idx"

  create_table "parents", :primary_key => "ID", :force => true do |t|
    t.string "FIRST_NAME", :limit => 20
    t.string "LAST_NAME",  :limit => 20
    t.string "LOGIN",      :limit => 20, :null => false
    t.string "PASSWORD",   :limit => 20, :null => false
    t.string "ADDRESS",    :limit => 50
    t.string "PHONE",      :limit => 20
    t.string "EMAIL",      :limit => 30
  end

  add_index "parents", ["ID"], :name => "ID", :unique => true
  add_index "parents", ["LOGIN"], :name => "LOGIN", :unique => true

  create_table "pupils", :primary_key => "ID", :force => true do |t|
    t.string  "FIRST_NAME",     :limit => 20, :null => false
    t.string  "LAST_NAME",      :limit => 20, :null => false
    t.string  "LOGIN",          :limit => 20, :null => false
    t.string  "ADDRESS",        :limit => 50
    t.string  "EMAIL",          :limit => 30
    t.date    "BIRTH_DATE",                   :null => false
    t.string  "BIRTH_NUMBER",   :limit => 11
    t.string  "PARENT_CONTACT", :limit => 50
    t.string  "PASSWORD",       :limit => 20, :null => false
    t.integer "PARENT_ID",      :limit => 8
  end

  add_index "pupils", ["ID"], :name => "ID", :unique => true
  add_index "pupils", ["LOGIN"], :name => "LOGIN", :unique => true
  add_index "pupils", ["PARENT_ID"], :name => "PUPIL_FK1"

  create_table "pupils_subjects", :id => false, :force => true do |t|
    t.integer "PUPIL_ID",   :limit => 8, :null => false
    t.integer "SUBJECT_ID", :limit => 8, :null => false
  end

  add_index "pupils_subjects", ["SUBJECT_ID"], :name => "PUPIL_SUBJECT_FK2"

  create_table "results", :id => false, :force => true do |t|
    t.integer "ID",          :limit => 8,  :null => false
    t.date    "RESULT_DATE",               :null => false
    t.string  "NAME",        :limit => 30, :null => false
    t.string  "DESCRIPTION", :limit => 30
    t.string  "EVALUATION",  :limit => 20, :null => false
    t.integer "PUPIL_ID",    :limit => 8,  :null => false
    t.integer "SUBJECT_ID",  :limit => 8,  :null => false
  end

  add_index "results", ["ID"], :name => "ID", :unique => true
  add_index "results", ["SUBJECT_ID"], :name => "RESULT_FK2_idx"

  create_table "schools", :primary_key => "ID", :force => true do |t|
    t.string "NAME",       :limit => 30
    t.string "ADDRESS",    :limit => 50
    t.string "PHONE",      :limit => 20
    t.string "EMAIL",      :limit => 30
    t.string "HEADMASTER", :limit => 30
    t.string "PHONE_MESS", :limit => 20
  end

  add_index "schools", ["ID"], :name => "ID", :unique => true

  create_table "subjects", :id => false, :force => true do |t|
    t.integer "ID",          :limit => 8,  :null => false
    t.string  "NAME",        :limit => 20
    t.string  "SHORT_NAME",  :limit => 4
    t.string  "DESCRIPTION", :limit => 20
    t.integer "EMPLOYEE_ID", :limit => 8,  :null => false
    t.integer "POSITION"
  end

  add_index "subjects", ["EMPLOYEE_ID"], :name => "SUBJECT_FK1"
  add_index "subjects", ["ID"], :name => "ID", :unique => true

  create_table "tasks", :id => false, :force => true do |t|
    t.integer "ID",          :limit => 8,   :null => false
    t.string  "NAME",        :limit => 20,  :null => false
    t.string  "DESCRIPTION", :limit => 100
    t.date    "DEADLINE",                   :null => false
    t.integer "STATE",                      :null => false
    t.integer "COUNCIL_ID",  :limit => 8
    t.integer "SUBJECT_ID",  :limit => 8,   :null => false
  end

  add_index "tasks", ["COUNCIL_ID"], :name => "TASK_FK2"
  add_index "tasks", ["ID"], :name => "ID", :unique => true

  create_table "timetables", :primary_key => "ID", :force => true do |t|
    t.string "YEAR", :limit => 9,  :null => false
    t.string "NAME", :limit => 50
  end

  add_index "timetables", ["ID"], :name => "ID", :unique => true

end
