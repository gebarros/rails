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

ActiveRecord::Schema.define(version: 2018_11_01_175904) do

  create_table "exams", force: :cascade do |t|
    t.string "exam_type"
    t.date "exam_date"
    t.date "delivery_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "patient_id"
    t.index ["patient_id"], name: "index_exams_on_patient_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.date "birth_date"
    t.string "address"
    t.string "address_number"
    t.string "address_complement"
    t.string "city"
    t.string "address_uf"
    t.string "phone"
    t.string "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "samples", force: :cascade do |t|
    t.string "sample_type"
    t.date "collect_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "exam_id"
    t.index ["exam_id"], name: "index_samples_on_exam_id"
  end

end
