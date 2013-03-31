# encoding: utf-8
class Activo::EspecificacionCisController < ApplicationController
  # GET /activo/especificacion_cis
  # GET /activo/especificacion_cis.json
  def index
    @activo_especificacion_cis = Activo::EspecificacionCi.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @activo_especificacion_cis }
    end
  end

  # GET /activo/especificacion_cis/new
  # GET /activo/especificacion_cis/new.json
  def new
    @activo_especificacion_ci = Activo::EspecificacionCi.new
    ci_id = params[:ci_id]
    @activo_especificacion_ci.ci_id=ci_id
    load_data
    render :layout =>false
  end

  # GET /activo/especificacion_cis/1/edit
  def edit
    @activo_especificacion_ci = Activo::EspecificacionCi.find(params[:id])
    load_data
    render :layout =>false
  end

  # POST /activo/especificacion_cis
  # POST /activo/especificacion_cis.json
  def create
    @activo_especificacion_ci = Activo::EspecificacionCi.new(params[:activo_especificacion_ci])
    @activo_ci = Activo::Ci.find(@activo_especificacion_ci.ci_id)
    respond_to do |format|
      if @activo_especificacion_ci.save
        format.html { redirect_to edit_activo_ci_path(@activo_ci), notice: 'Guardado Correctamente.' }
        format.json { render json: @activo_especificacion_ci, status: :created, location: @activo_especificacion_ci }
      else
        format.html { render action: "new" }
        format.json { render json: @activo_especificacion_ci.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /activo/especificacion_cis/1
  # PUT /activo/especificacion_cis/1.json
  def update
    @activo_especificacion_ci = Activo::EspecificacionCi.find(params[:id])
    @activo_ci = Activo::Ci.find(@activo_especificacion_ci.ci_id)
    respond_to do |format|
      if @activo_especificacion_ci.update_attributes(params[:activo_especificacion_ci])
        format.html { redirect_to edit_activo_ci_path(@activo_ci), notice: 'Actualizado Correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @activo_especificacion_ci.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activo/especificacion_cis/1
  # DELETE /activo/especificacion_cis/1.json
  def destroy
    @activo_especificacion_ci = Activo::EspecificacionCi.find(params[:id])
    @activo_ci = Activo::Ci.find(@activo_especificacion_ci.ci_id)
     if @activo_especificacion_ci.destroy
      flash[:notice] = 'Eliminado Correctamente'
    end

    respond_to do |format|
      format.html { redirect_to edit_activo_ci_path(@activo_ci) }
      format.json { head :no_content }
    end
  end
  
  def load_data
    @estado_id= Catalogo::Catalogo.where("tipo_catalogo_id=1")
    @prop_esp_ci_id = Activo::PropiedadEspecificaCi.all
  end
end
