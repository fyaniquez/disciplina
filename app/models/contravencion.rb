class Contravencion < ApplicationRecord
  belongs_to :caso
  belongs_to :falta
  belongs_to :involucrado  
  validates :descripcion, :presence => true
end
