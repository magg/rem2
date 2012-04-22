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


ActiveRecord::Schema.define(:version => 20120421182813) do

  create_table "admins", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "usuario_id"
  end

  create_table "clients", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "usuario_id"
    t.integer  "project_id"
  end

  create_table "criterios", :force => true do |t|
    t.text     "descripcion"
    t.integer  "story_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "periodo"
    t.integer  "client_id"
  end

  create_table "sprints", :force => true do |t|
    t.string   "comentario"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.date     "fechainicio"
    t.date     "fechafin"
  end

  create_table "sprints_stories", :id => false, :force => true do |t|
    t.integer "sprint_id"
    t.integer "story_id"
  end

  create_table "statuses", :force => true do |t|
    t.string   "descripcion"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "stories", :force => true do |t|
    t.string   "name"
    t.integer  "status_id",   :default => 1
    t.text     "descripcion"
    t.integer  "functionpts"
    t.string   "prioridad"
    t.string   "usuario"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.text     "comentarios"
    t.integer  "project_id"
  end

  create_table "students", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "rol"
    t.integer  "usuario_id"
    t.integer  "team_id"
  end

  create_table "tasks", :force => true do |t|
    t.text     "descripcion"
    t.integer  "estimadoinicial"
    t.string   "status"
    t.integer  "story_id"
    t.integer  "student_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "teams", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "project_id"
  end

  create_table "usuarios", :force => true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "tipo"
    t.string   "auth_token"
    t.string   "email"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
  end

  create_table "workdetails", :force => true do |t|
    t.integer  "task_id"
    t.integer  "hrstrabajadas"
    t.integer  "hrsporterminar"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

end
