json.extract! documento, :id, :fecha, :seguimiento_id, :archivo, :descripcion, :created_at, :updated_at
json.url documento_url(documento, format: :json)
