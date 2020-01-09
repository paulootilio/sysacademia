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

ActiveRecord::Schema.define(version: 2018_10_04_181432) do

  create_table "clientes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "cpf"
    t.string "telefone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entradas", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "cliente_id"
    t.bigint "plano_id"
    t.bigint "modalidade_id"
    t.string "descricao"
    t.float "valor"
    t.float "desconto"
    t.float "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_entradas_on_cliente_id"
    t.index ["modalidade_id"], name: "index_entradas_on_modalidade_id"
    t.index ["plano_id"], name: "index_entradas_on_plano_id"
  end

  create_table "exercicios", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nome"
    t.integer "serie"
    t.string "rept"
    t.string "carga"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exrciciotreinos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "treino_id"
    t.bigint "exercicio_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercicio_id"], name: "index_exrciciotreinos_on_exercicio_id"
    t.index ["treino_id"], name: "index_exrciciotreinos_on_treino_id"
  end

  create_table "fornecedors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "cpf"
    t.string "telefone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "modalidades", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nome"
    t.string "descricao"
    t.boolean "receita"
    t.boolean "despesa"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "planos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nome"
    t.string "referente"
    t.string "descricao"
    t.string "valor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "saidas", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "fornecedor_id"
    t.bigint "modalidade_id"
    t.string "descricao"
    t.string "valor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fornecedor_id"], name: "index_saidas_on_fornecedor_id"
    t.index ["modalidade_id"], name: "index_saidas_on_modalidade_id"
  end

  create_table "treinos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "cliente_id"
    t.bigint "plano_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_treinos_on_cliente_id"
    t.index ["plano_id"], name: "index_treinos_on_plano_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nome"
    t.string "tipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "entradas", "clientes"
  add_foreign_key "entradas", "modalidades"
  add_foreign_key "entradas", "planos"
  add_foreign_key "exrciciotreinos", "exercicios"
  add_foreign_key "exrciciotreinos", "treinos"
  add_foreign_key "saidas", "fornecedors"
  add_foreign_key "saidas", "modalidades"
  add_foreign_key "treinos", "clientes"
  add_foreign_key "treinos", "planos"
end
