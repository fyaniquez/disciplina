class CastigosController < ApplicationController
  before_action :get_caso, only: %i[ index ]
  before_action :get_involucrado, only: %i[ index ]
  before_action :set_castigo, only: %i[ show edit update destroy ]

  # GET /castigos or /castigos.json
  def index
    @castigos = Castigo.all
  end

  # GET /castigos/1 or /castigos/1.json
  def show
  end

  # GET /castigos/new
  def new
    @castigo = Castigo.new
    @castigo.fecha = Time.now
    @castigo.estado = 'Pendiente'
    @castigo.caso_id = param[:caso_id]
    @castigo.involucrado_id = params[:involucrado_id]
    @sanciones = Sancion.all
    @involucrado = Involucrado.find(@contravencion.involucrado_id)
  end

  # GET /castigos/1/edit
  def edit
    @sanciones = Sancion.all
  end

  # POST /castigos or /castigos.json
  def create
    @castigo = Castigo.new(castigo_params)
    @involucrado = Involucrado.find(@contravencion.involucrado_id)
    @alumno = Alumno.find(@involucrado.alumno_id)

    respond_to do |format|
      if @castigo.save
        format.html { redirect_to @involucrado, notice: "Castigo was successfully created." }
        format.json { render :show, status: :created, location: @castigo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @castigo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /castigos/1 or /castigos/1.json
  def update
    respond_to do |format|
      if @castigo.update(castigo_params)
        format.html { redirect_to @castigo.involucrado, notice: "El Castigo Nro. #{@castigo.id} fue modificado." }
        format.json { render :show, status: :ok, location: @castigo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @castigo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /castigos/1 or /castigos/1.json
  def destroy
    @castigo.destroy
    respond_to do |format|
      format.html { redirect_to @contravencion.involucrado, notice: "Castigo borrado." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_castigo
      @castigo = Castigo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def castigo_params
      params.require(:castigo).permit(:fecha, :estado, :caso_id, :sancion_id, :involucrado_id, :descripcion)
    end

    def get_caso
      @caso = Caso.find(params[:caso_id])
    end

    def get_involucrado
      @involucrado = Involucrado.find(params[:involucrado_id])
    end
end
