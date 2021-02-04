class CasosController < ApplicationController
  before_action :set_caso, only: %i[ show edit update destroy ]

  # GET /casos or /casos.json
  def index
    @casos = Caso.all
  end

  # GET /casos/1 or /casos/1.json
  def show
    @involucrados = Involucrado.where(caso_id: @caso.id).includes(:alumno) || Hash.new
    @castigos = Castigo.where(caso_id: @caso.id) || Hash.new
    @seguimientos = Seguimiento.where(["caso_id = ?", @caso.id]) || Hash.new
  end

  # GET /casos/new
  def new
    @caso = Caso.new
    @caso.estado = "Abierto"
    @caso.fecha = Time.now
    @involucrados = Hash.new
    @castigos = Hash.new
    @seguimientos = Hash.new
  end

  # GET /casos/1/edit
  def edit
    @involucrados = Involucrado.where(caso_id: @caso.id).includes(:alumno)
    @castigos = Castigo.where(caso_id: @caso.id)
    @seguimientos = Seguimiento.where(caso_id: @caso_id)
  end

  # POST /casos or /casos.json
  def create
    @caso = Caso.new(caso_params)

    respond_to do |format|
      if @caso.save
        format.html { redirect_to @caso, notice: "Caso creado." }
        format.json { render :show, status: :created, location: @caso }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @caso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /casos/1 or /casos/1.json
  def update
    respond_to do |format|
      if @caso.update(caso_params)
        format.html { redirect_to @caso, notice: "Caso actualizado." }
        format.json { render :show, status: :ok, location: @caso }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @caso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /casos/1 or /casos/1.json
  def destroy
    begin
      @caso.destroy
    rescue ActiveRecord::InvalidForeignKey => e
      respond_to do |format|
        format.html { redirect_to casos_url, notice: "No puede borrar el Caso hasta no eliminar los involucrados" }
        format.json { rhead :no_content }
      end
      return
    end

    respond_to do |format|
      format.html { redirect_to casos_url, notice: "Caso borrado." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_caso
      @caso = Caso.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def caso_params
      params.require(:caso).permit(:fecha, :estado, :denunciante, :descripcion, :responsable)
    end
end
