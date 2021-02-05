class Documento < ApplicationRecord
  belongs_to :seguimiento
  validates :descripcion, :presence => true
  validates :archivo, :presence => true
end