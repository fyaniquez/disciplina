class ContravencionesController < ApplicationController
  before_action :get_caso, only: %i[ index ]
  before_action :get_involucrado, only: %i[ index ]
  before_action :set_contravencion, only: %i[ show edit update destroy ]

  # GET /contravenciones or /contravenciones.json
  def index
    @contravenciones = Contravencion.all
  end

  # GET /contravenciones/1 or /contravenciones/1.json
  def show
  end

  # GET /contravenciones/new
  def new
    @contravencion = Contravencion.new
    @contravencion.fecha = Time.now
    @contravencion.estado = 'Vigente'
    @contravencion.caso_id = params[:caso_id]
    @contravencion.involucrado_id = params[:involucrado_id]
    @involucrado = Involucrado.find(@contravencion.involucrado_id)
    #@alumno = Alumno.find(@involucrado.alumno_id)
  end

  # GET /contravenciones/1/edit
  def edit
  end

  # POST /contravenciones or /contravenciones.json
  def create
    @contravencion = Contravencion.new(contravencion_params)
    @involucrado = Involucrado.find(@contravencion.involucrado_id)
    @alumno = Alumno.find(@involucrado.alumno_id)

    respond_to do |format|
      if @contravencion.save
        format.html { redirect_to @involucrado, notice: "Una nueva Contravencion fue añadida." }
        format.json { render :show, status: :created, location: @contravencion }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contravencion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contravenciones/1 or /contravenciones/1.json
  def update
    respond_to do |format|
      if @contravencion.update(contravencion_params)
        format.html { redirect_to @contravencion.involucrado, notice: "La Contravencion Nro. #{@contravencion.id} fue modificada." }
        format.json { render :show, status: :ok, location: @contravencion }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @contravencion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contravenciones/1 or /contravenciones/1.json
  def destroy
    @contravencion.destroy
    respond_to do |format|
      format.html { redirect_to @contravencion.involucrado, notice: "Contravencion borrada" }
      #format.html { redirect_to contravenciones_url, notice: "Contravencion was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contravencion
      @contravencion = Contravencion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contravencion_params
      params.require(:contravencion).permit(:fecha, :estado, :caso_id, :falta_id, :involucrado_id, :descripcion)
    end

    def get_caso
      @caso = Caso.find(params[:caso_id])
    end

    def get_involucrado
      @involucrado = Involucrado.find(params[:involucrado_id])
    end
end
