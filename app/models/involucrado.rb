class Involucrado < ApplicationRecord
  belongs_to :caso
  belongs_to :alumno
  validates :participacion, :presence => true
  validates_uniqueness_of :alumno_id, scope: :caso_id, :message => "ya está involucrado en el caso"
end
