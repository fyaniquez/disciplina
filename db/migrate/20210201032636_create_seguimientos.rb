class CreateSeguimientos < ActiveRecord::Migration[6.1]
  def change
    create_table :seguimientos do |t|
      t.datetime :fecha
      t.references :caso, null: false, foreign_key: true
      t.integer :numero
      t.text :glosa

      t.timestamps
    end
  end
end
