class CreateAlumnos < ActiveRecord::Migration[6.1]
  def change
    create_table :alumnos do |t|
      t.string :nombre
      t.string :rude
      t.string :ci

      t.timestamps
    end
  end
end
