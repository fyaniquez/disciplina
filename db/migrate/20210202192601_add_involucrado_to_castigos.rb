class AddInvolucradoToCastigos < ActiveRecord::Migration[6.1]
  def change
    add_reference :castigos, :involucrado, null: true, foreign_key: true
  end
end
