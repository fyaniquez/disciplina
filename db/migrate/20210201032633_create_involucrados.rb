class CreateInvolucrados < ActiveRecord::Migration[6.1]
  def change
    create_table :involucrados do |t|
      t.datetime :fecha
      t.string :estado
      t.references :caso, null: false, foreign_key: true
      t.references :alumno, null: false, foreign_key: true
      t.text :participacion

      t.timestamps
    end
  end
end
