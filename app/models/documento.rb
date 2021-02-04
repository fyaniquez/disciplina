class Documento < ApplicationRecord
  belongs_to :seguimiento
  #mount_uploader :adjunto, AdjuntoUploader
end