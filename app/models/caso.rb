class Caso < ApplicationRecord
  validates :denunciante, :presence => true
  validates :descripcion, :presence => true
  validates :responsable, :presence => true
end
