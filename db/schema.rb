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

ActiveRecord::Schema.define(version: 2021_02_03_162044) do

  create_table "alumnos", force: :cascade do |t|
    t.string "nombre"
    t.string "rude"
    t.string "ci"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "casos", force: :cascade do |t|
    t.datetime "fecha"
    t.string "estado"
    t.string "denunciante"
    t.text "descripcion"
    t.string "responsable"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "castigos", force: :cascade do |t|
    t.datetime "fecha"
    t.string "estado"
    t.integer "caso_id", null: false
    t.integer "sancion_id", null: false
    t.text "descripcion"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "involucrado_id"
    t.index ["caso_id"], name: "index_castigos_on_caso_id"
    t.index ["involucrado_id"], name: "index_castigos_on_involucrado_id"
    t.index ["sancion_id"], name: "index_castigos_on_sancion_id"
  end

  create_table "contravenciones", force: :cascade do |t|
    t.datetime "fecha"
    t.string "estado"
    t.integer "caso_id", null: false
    t.integer "falta_id", null: false
    t.text "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "involucrado_id"
  end

  create_table "contravenciones_old", force: :cascade do |t|
    t.datetime "fecha"
    t.string "estado"
    t.integer "caso_id", null: false
    t.integer "falta_id", null: false
    t.text "descripcion"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "involucrado_id"
    t.index ["caso_id"], name: "index_contravenciones_on_caso_id"
    t.index ["falta_id"], name: "index_contravenciones_on_falta_id"
    t.index ["involucrado_id"], name: "index_contravenciones_on_involucrado_id"
  end

  create_table "documentos", force: :cascade do |t|
    t.datetime "fecha"
    t.integer "seguimiento_id", null: false
    t.string "archivo"
    t.text "descripcion"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "adjunto"
    t.index ["seguimiento_id"], name: "index_documentos_on_seguimiento_id"
  end

  create_table "faltas", force: :cascade do |t|
    t.string "tipo"
    t.string "nombre"
    t.string "norma"
    t.string "posicion"
    t.text "descripcion"
    t.text "sanciones"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "involucrados", force: :cascade do |t|
    t.datetime "fecha"
    t.string "estado"
    t.integer "caso_id", null: false
    t.integer "alumno_id", null: false
    t.text "participacion"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["alumno_id"], name: "index_involucrados_on_alumno_id"
    t.index ["caso_id"], name: "index_involucrados_on_caso_id"
  end

  create_table "sanciones", force: :cascade do |t|
    t.string "estado"
    t.string "norma"
    t.string "posicion"
    t.string "nombre"
    t.text "descripcion"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "seguimientos", force: :cascade do |t|
    t.datetime "fecha"
    t.integer "caso_id", null: false
    t.integer "numero"
    t.text "glosa"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["caso_id"], name: "index_seguimientos_on_caso_id"
  end

  add_foreign_key "castigos", "casos"
  add_foreign_key "castigos", "involucrados"
  add_foreign_key "castigos", "sanciones"
  add_foreign_key "contravenciones", "casos"
  add_foreign_key "contravenciones", "faltas"
  add_foreign_key "contravenciones", "involucrados"
  add_foreign_key "contravenciones_old", "casos"
  add_foreign_key "contravenciones_old", "falta"
  add_foreign_key "contravenciones_old", "involucrados"
  add_foreign_key "documentos", "seguimientos"
  add_foreign_key "involucrados", "alumnos"
  add_foreign_key "involucrados", "casos"
  add_foreign_key "seguimientos", "casos"
end
