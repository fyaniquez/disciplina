json.extract! sancion, :id, :estado, :norma, :posicion, :nombre, :descripcion, :created_at, :updated_at
json.url sancion_url(sancion, format: :json)
