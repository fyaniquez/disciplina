class Castigo < ApplicationRecord
  belongs_to :caso
  belongs_to :sancion
  belongs_to :involucrado
  validates :descripcion, :presence => true
end
