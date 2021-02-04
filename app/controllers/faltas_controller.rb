class FaltasController < ApplicationController
  before_action :set_falta, only: %i[ show edit update destroy ]

  # GET /faltas or /faltas.json
  def index
    @faltas = Falta.all
  end

  # GET /faltas/1 or /faltas/1.json
  def show
  end

  # GET /faltas/new
  def new
    @falta = Falta.new
  end

  # GET /faltas/1/edit
  def edit
  end

  # POST /faltas or /faltas.json
  def create
    @falta = Falta.new(falta_params)

    respond_to do |format|
      if @falta.save
        format.html { redirect_to @falta, notice: "Falta was successfully created." }
        format.json { render :show, status: :created, location: @falta }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @falta.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /faltas/1 or /faltas/1.json
  def update
    respond_to do |format|
      if @falta.update(falta_params)
        format.html { redirect_to @falta, notice: "Falta was successfully updated." }
        format.json { render :show, status: :ok, location: @falta }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @falta.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /faltas/1 or /faltas/1.json
  def destroy
    @falta.destroy
    respond_to do |format|
      format.html { redirect_to faltas_url, notice: "Falta was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_falta
      @falta = Falta.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def falta_params
      params.require(:falta).permit(:tipo, :nombre, :norma, :posicion, :descripcion, :sanciones)
    end
end
