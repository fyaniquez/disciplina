class Seguimiento < ApplicationRecord
  belongs_to :caso
  validates :glosa, :presence => true
end
