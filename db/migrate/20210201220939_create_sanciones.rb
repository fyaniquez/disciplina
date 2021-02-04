class CreateSanciones < ActiveRecord::Migration[6.1]
  def change
    create_table :sanciones do |t|
      t.string :estado
      t.string :norma
      t.string :posicion
      t.string :nombre
      t.text :descripcion

      t.timestamps
    end
  end
end
