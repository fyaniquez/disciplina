class DocumentosController < ApplicationController
  before_action :set_documento, only: %i[ show edit update destroy ]

  # GET /documentos or /documentos.json
  def index
    @documentos = Documento.all
  end

  # GET /documentos/1 or /documentos/1.json
  def show
  end

  # GET /documentos/new
  def new
    @documento = Documento.new
    @documento.fecha = Time.now
  end

  # GET /documentos/1/edit
  def edit
  end

  # POST /documentos or /documentos.json
  def create
    @documento = Documento.new(documento_params)
    upload   
    respond_to do |format|
      if @documento.save
        format.html { redirect_to @documento, notice: "Documento was successfully created." }
        format.json { render :show, status: :created, location: @documento }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @documento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documentos/1 or /documentos/1.json
  def update
    respond_to do |format|
      if @documento.update(documento_params)
        format.html { redirect_to @documento, notice: "Documento was successfully updated." }
        format.json { render :show, status: :ok, location: @documento }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @documento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documentos/1 or /documentos/1.json
  def destroy
    @documento.destroy
    respond_to do |format|
      format.html { redirect_to documentos_url, notice: "Documento was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_documento
      @documento = Documento.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def documento_params
      params.require(:documento).permit(:fecha, :seguimiento_id, :archivo, :descripcion)
    end

    # descarga el archivo en la carpeta /public/docs
    # lo renombra como los milisegundos y coloca el nombre en adjunto
    # el nombre original se adjunta a la descripcion
    def upload
      uploaded_file = params[:documento][:archivo]
      nombre_original = uploaded_file.original_filename
      extension = File.extname(nombre_original)      
      @documento.adjunto = "#{@documento.seguimiento.caso_id}-#{DateTime.now.strftime('%Q')}#{extension}"
      File.open(Rails.root.join('public', 'docs', @documento.adjunto), 'wb') do |file|
        file.write(uploaded_file.read)
      end
      @documento.archivo = uploaded_file.original_filename
    end
end
