class InvolucradosController < ApplicationController
  before_action :get_caso, only: %i[ index ]
  before_action :set_involucrado, only: %i[ show edit update destroy ]

  # GET /involucrados or /involucrados.json
  def index
    @involucrados = Involucrado.all
  end

  # GET /involucrados/1 or /involucrados/1.json
  def show
    @contravenciones = Contravencion.where(["caso_id=? and involucrado_id=?", @involucrado.caso_id, @involucrado.id])
    @castigos = Castigo.where(["caso_id=? and involucrado_id=?", @involucrado.caso_id, @involucrado.id])
    @alumno = Alumno.find(@involucrado.alumno_id)
  end

  # GET /involucrados/new
  def new
    @involucrado = Involucrado.new
    @alumnos = Alumno.all
    @involucrado.fecha = Time.now
    @involucrado.estado = "Vigente"
    @involucrado.caso_id = params[:caso_id]
    @enlace = "/caso/#{@involucrado.caso.id}/alumno/new"
  end

  # GET /involucrados/1/edit
  def edit
    @alumnos = Alumno.all
    @enlace = "/caso/#{@involucrado.caso.id}/alumno/new"
  end

  # POST /involucrados or /involucrados.json
  def create
    @involucrado = Involucrado.new(involucrado_params)
    respond_to do |format|
      if @involucrado.save
        format.html { redirect_to @involucrado.caso, notice: "Involucrado creado." }
        format.json { render :show, status: :created, location: @involucrado }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @involucrado.errors, status: :unprocessable_entity }
      end  
    end
  end

  # PATCH/PUT /involucrados/1 or /involucrados/1.json
  def update
    respond_to do |format|
      if @involucrado.update!(involucrado_params)
        #format.html { redirect_to @involucrado, notice: "Involucrado actualizado." }
        format.html { redirect_to @involucrado.caso, notice: "Involucrado actualizado." }
        format.json { render :show, status: :ok, location: @involucrado }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @involucrado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /involucrados/1 or /involucrados/1.json
  def destroy
    begin
      @involucrado.destroy
    rescue ActiveRecord::InvalidForeignKey => e
      respond_to do |format|
        format.html { redirect_to @involucrado.caso, notice: "No puede borrar el involucrado hasta no eliminar sus contravenciones y castigos." }
        format.json { head :no_content }
      end
      return
    end
    respond_to do |format|
      format.html { redirect_to @involucrado.caso, notice: "Involucrado borrado." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_involucrado
    @involucrado = Involucrado.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def involucrado_params
    params.require(:involucrado).permit(:fecha, :estado, :caso_id, :alumno_id, :participacion)
  end

  def get_caso
    @caso = Caso.find(params[:caso_id])
  end
end
