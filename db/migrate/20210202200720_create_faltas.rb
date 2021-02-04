class CreateFaltas < ActiveRecord::Migration[6.1]
  def change
    create_table :faltas do |t|
      t.string :tipo
      t.string :nombre
      t.string :norma
      t.string :posicion
      t.text :descripcion
      t.text :sanciones

      t.timestamps
    end
  end
end
