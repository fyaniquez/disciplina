class CreateCasos < ActiveRecord::Migration[6.1]
  def change
    create_table :casos do |t|
      t.datetime :fecha
      t.string :estado
      t.string :denunciante
      t.text :descripcion
      t.string :responsable

      t.timestamps
    end
  end
end
