class RemoveAlumnoFromContravenciones < ActiveRecord::Migration[6.1]
  def change
    remove_reference :contravenciones, :alumno, null: false, foreign_key: true
  end
end
