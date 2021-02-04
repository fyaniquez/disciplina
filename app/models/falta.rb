class Falta < ApplicationRecord
  def tipo_nombre
    "#{tipo}:#{nombre}"
  end
end
