class RemoveAlumnoFromCastigos < ActiveRecord::Migration[6.1]
  def change
    remove_reference :castigos, :alumno, null: false, foreign_key: true
  end
end
