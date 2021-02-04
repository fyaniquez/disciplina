class AddAdjuntoToDocumentos < ActiveRecord::Migration[6.1]
  def change
    add_column :documentos, :adjunto, :string
  end
end
