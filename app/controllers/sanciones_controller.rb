class SancionesController < ApplicationController
  before_action :set_sancion, only: %i[ show edit update destroy ]

  # GET /sanciones or /sanciones.json
  def index
    @sanciones = Sancion.all
  end

  # GET /sanciones/1 or /sanciones/1.json
  def show
  end

  # GET /sanciones/new
  def new
    @sancion = Sancion.new
  end

  # GET /sanciones/1/edit
  def edit
  end

  # POST /sanciones or /sanciones.json
  def create
    @sancion = Sancion.new(sancion_params)

    respond_to do |format|
      if @sancion.save
        format.html { redirect_to @sancion, notice: "Sancion was successfully created." }
        format.json { render :show, status: :created, location: @sancion }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sancion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sanciones/1 or /sanciones/1.json
  def update
    respond_to do |format|
      if @sancion.update(sancion_params)
        format.html { redirect_to @sancion, notice: "Sancion was successfully updated." }
        format.json { render :show, status: :ok, location: @sancion }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sancion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sanciones/1 or /sanciones/1.json
  def destroy
    @sancion.destroy
    respond_to do |format|
      format.html { redirect_to sanciones_url, notice: "Sancion was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sancion
      @sancion = Sancion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sancion_params
      params.require(:sancion).permit(:estado, :norma, :posicion, :nombre, :descripcion)
    end
end
