class CreateContravencions < ActiveRecord::Migration[6.1]
  def change
    create_table :contravencions do |t|
      t.datetime :fecha
      t.string :estado
      t.references :caso, null: false, foreign_key: true
      t.references :falta, null: false, foreign_key: true
      t.references :alumno, null: false, foreign_key: true
      t.text :descripcion

      t.timestamps
    end
  end
end
