class CreateDocumentos < ActiveRecord::Migration[6.1]
  def change
    create_table :documentos do |t|
      t.datetime :fecha
      t.references :seguimiento, null: false, foreign_key: true
      t.string :archivo
      t.text :descripcion

      t.timestamps
    end
  end
end
