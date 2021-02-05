class Alumno < ApplicationRecord
  validates :nombre, :presence => true
  validates :rude, :presence => true
  validates :ci, :presence => true
  validates_uniqueness_of :rude, :message => "ya pertenece a otro alumno"
  validates_uniqueness_of :ci, :message => "ya pertenece a otro alumno"
end
