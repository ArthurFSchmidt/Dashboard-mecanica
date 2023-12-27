# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2023_12_27_120253) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clientes", force: :cascade do |t|
    t.text "nome"
    t.text "endereco"
    t.text "telefone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "equipes", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mecanicos", force: :cascade do |t|
    t.string "nome"
    t.text "endereco"
    t.string "especialidade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "equipe_id"
    t.index ["equipe_id"], name: "index_mecanicos_on_equipe_id"
  end

  create_table "ordems", force: :cascade do |t|
    t.date "dataEmissao"
    t.date "dataConclusao"
    t.float "valor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "veiculo_id"
    t.bigint "equipe_id"
    t.bigint "partes", default: [], array: true
    t.bigint "servicos", default: [], array: true
    t.text "problema"
    t.string "status"
    t.string "placa"
    t.index ["equipe_id"], name: "index_ordems_on_equipe_id"
    t.index ["partes"], name: "index_ordems_on_partes", using: :gin
    t.index ["servicos"], name: "index_ordems_on_servicos", using: :gin
    t.index ["veiculo_id"], name: "index_ordems_on_veiculo_id"
  end

  create_table "ordems_partes", force: :cascade do |t|
    t.bigint "ordem_id"
    t.bigint "parte_id"
    t.index ["ordem_id"], name: "index_ordems_partes_on_ordem_id"
    t.index ["parte_id"], name: "index_ordems_partes_on_parte_id"
  end

  create_table "ordems_servicos", force: :cascade do |t|
    t.bigint "ordem_id"
    t.bigint "servico_id"
    t.index ["ordem_id"], name: "index_ordems_servicos_on_ordem_id"
    t.index ["servico_id"], name: "index_ordems_servicos_on_servico_id"
  end

  create_table "partes", force: :cascade do |t|
    t.string "nome"
    t.text "descricao"
    t.float "valor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "marca"
    t.string "modelo"
  end

  create_table "servicos", force: :cascade do |t|
    t.string "nome"
    t.text "descricao"
    t.float "valor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "veiculos", force: :cascade do |t|
    t.string "placa"
    t.text "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cliente_id"
    t.string "modelo"
    t.string "marca"
    t.integer "ano"
    t.string "cor"
    t.index ["cliente_id"], name: "index_veiculos_on_cliente_id"
  end

end
