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

ActiveRecord::Schema.define(version: 20160825180425) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "absences", force: :cascade do |t|
    t.boolean  "absence"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "absences_students", id: false, force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "absence_id", null: false
    t.index ["absence_id", "student_id"], name: "index_absences_students_on_absence_id_and_student_id", using: :btree
    t.index ["student_id", "absence_id"], name: "index_absences_students_on_student_id_and_absence_id", using: :btree
  end

  create_table "classrooms", force: :cascade do |t|
    t.string   "name"
    t.integer  "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "classrooms_students", id: false, force: :cascade do |t|
    t.integer "student_id",   null: false
    t.integer "classroom_id", null: false
    t.index ["classroom_id", "student_id"], name: "index_classrooms_students_on_classroom_id_and_student_id", using: :btree
    t.index ["student_id", "classroom_id"], name: "index_classrooms_students_on_student_id_and_classroom_id", using: :btree
  end

  create_table "questions", force: :cascade do |t|
    t.boolean  "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions_students", id: false, force: :cascade do |t|
    t.integer "student_id",  null: false
    t.integer "question_id", null: false
    t.index ["question_id", "student_id"], name: "index_questions_students_on_question_id_and_student_id", using: :btree
    t.index ["student_id", "question_id"], name: "index_questions_students_on_student_id_and_question_id", using: :btree
  end

  create_table "students", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
