class AlumnosController < ApplicationController
  before_action :set_alumno, only: %i[ show edit update destroy ]
  before_action :get_caso, only: %i[ new ]

  # GET /alumnos or /alumnos.json
  def index
    @alumnos = Alumno.all
  end

  # GET /alumnos/1 or /alumnos/1.json
  def show
  end

  # GET /alumnos/new
  def new
    @alumno = Alumno.new
    @alumno.caso__id = @caso.id
  end

  # GET /alumnos/1/edit
  def edit
  end

  # POST /alumnos or /alumnos.json
  def create    
    @alumno = Alumno.new(alumno_params)    
    respond_to do |format|
      if @alumno.save
        format.html { redirect_to new_caso_involucrado_path(@alumno.caso__id), notice: "Alumno creado." }
        format.json { render :show, status: :created, location: @alumno }
      else
        format.html { render :new, status: :unprocessable_entity }        
        #format.html { redirect_to new_caso_alumno_path(caso__id), notice: "Error" }
        format.json { render json: @alumno.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /alumnos/1 or /alumnos/1.json
  def update
    respond_to do |format|
      if @alumno.update(alumno_params)
        format.html { redirect_to @alumno, notice: "Alumno modificado." }
        format.json { render :show, status: :ok, location: @alumno }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @alumno.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alumnos/1 or /alumnos/1.json
  def destroy
    begin
      @alumno.destroy
    rescue ActiveRecord::InvalidForeignKey => e
      respond_to do |format|
        format.html { redirect_to alumnos_url, notice: "No puede borrar el alumno hasta no haber borrado sus casos." }
        format.json { head :no_content }
      end
      return
    end
    respond_to do |format|
      format.html { redirect_to alumnos_url, notice: "Alumno borrado." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alumno
      @alumno = Alumno.find(params[:id])
    end

    def get_caso
      @caso = Caso.find(params[:caso_id])
    end

    # Only allow a list of trusted parameters through.
    def alumno_params
      params.require(:alumno).permit(:nombre, :rude, :ci, :caso__id)
    end
end
