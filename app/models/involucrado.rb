class Involucrado < ApplicationRecord
  belongs_to :caso
  belongs_to :alumno
  validates :participacion, :presence => true
end
