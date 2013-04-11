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

ActiveRecord::Schema.define(:version => 20130411151819) do

  create_table "mesasredondas", :force => true do |t|
    t.string   "title"
    t.date     "data"
    t.integer  "palestrante_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "mesasredondas", ["palestrante_id"], :name => "index_mesasredondas_on_palestrante_id"

  create_table "minicursos", :force => true do |t|
    t.string   "title"
    t.date     "date_ini"
    t.date     "date_fim"
    t.integer  "vacancies"
    t.integer  "palestrante_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.time     "time_ini"
    t.time     "time_fim"
  end

  add_index "minicursos", ["palestrante_id"], :name => "index_minicursos_on_palestrante_id"

  create_table "palestrantes", :force => true do |t|
    t.string   "name"
    t.string   "institution"
    t.string   "lattes"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "palestras", :force => true do |t|
    t.string   "title"
    t.date     "data"
    t.time     "hora"
    t.integer  "palestrante_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "palestras", ["palestrante_id"], :name => "index_palestras_on_palestrante_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "cpf"
    t.string   "institution"
    t.integer  "minicurso_id"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "status",                 :default => false
    t.string   "tipo"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["minicurso_id"], :name => "index_users_on_minicurso_id"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
