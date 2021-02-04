class AddInvolucradoToContravenciones < ActiveRecord::Migration[6.1]
  def change
    add_reference :contravenciones, :involucrado, null: true, foreign_key: true
  end
end
