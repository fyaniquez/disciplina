class SeguimientosController < ApplicationController
  before_action :get_caso, only: %i[ index ]
  before_action :set_seguimiento, only: %i[ show edit update destroy ]

  # GET /seguimientos or /seguimientos.json
  def index
    @seguimientos = Seguimiento.all
  end

  # GET /seguimientos/1 or /seguimientos/1.json
  def show
    @documentos = Documento.where(["seguimiento_id = ?", @seguimiento.id])
  end

  # GET /seguimientos/new
  def new
    @seguimiento = Seguimiento.new
    @seguimiento.fecha = Time.now
    @seguimiento.caso_id = params[:caso_id]
  end

  # GET /seguimientos/1/edit
  def edit
  end

  # POST /seguimientos or /seguimientos.json
  def create
    @seguimiento = Seguimiento.new(seguimiento_params)

    respond_to do |format|
      if @seguimiento.save
        format.html { redirect_to @seguimiento, notice: "Seguimiento creado." }
        format.json { render :show, status: :created, location: @seguimiento }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @seguimiento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /seguimientos/1 or /seguimientos/1.json
  def update
    respond_to do |format|
      if @seguimiento.update(seguimiento_params)
        format.html { redirect_to @seguimiento, notice: "Seguimiento actualizado." }
        format.json { render :show, status: :ok, location: @seguimiento }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @seguimiento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /seguimientos/1 or /seguimientos/1.json
  def destroy
    @seguimiento.destroy
    respond_to do |format|
      format.html { redirect_to seguimientos_url, notice: "Seguimiento borrado." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seguimiento
      @seguimiento = Seguimiento.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def seguimiento_params
      params.require(:seguimiento).permit(:fecha, :caso_id, :numero, :glosa)
    end

    def get_caso
      @caso = Caso.find(params[:caso_id])
    end
end
