# encoding: utf-8
class Activo::DatoTrabajoCisController < ApplicationController
  # GET /activo/dato_trabajo_cis
  # GET /activo/dato_trabajo_cis.json
  def index
    @activo_dato_trabajo_cis = Activo::DatoTrabajoCi.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @activo_dato_trabajo_cis }
    end
  end

  # GET /activo/dato_trabajo_cis/new
  # GET /activo/dato_trabajo_cis/new.json
  def new
    @activo_dato_trabajo_ci = Activo::DatoTrabajoCi.new
    ci_id = params[:ci_id]
    @activo_dato_trabajo_ci.ci_id=ci_id
    load_data
    render :layout =>false
  end

  # GET /activo/dato_trabajo_cis/1/edit
  def edit
    @activo_dato_trabajo_ci = Activo::DatoTrabajoCi.find(params[:id])
    load_data
    render :layout =>false
  end

  # POST /activo/dato_trabajo_cis
  # POST /activo/dato_trabajo_cis.json
  def create
    @activo_dato_trabajo_ci = Activo::DatoTrabajoCi.new(params[:activo_dato_trabajo_ci])

    @activo_ci = Activo::Ci.find(@activo_dato_trabajo_ci.ci_id)

    respond_to do |format|
      if @activo_dato_trabajo_ci.save
        format.html { redirect_to edit_activo_ci_path(@activo_ci), notice: 'Guardado Correctamente.' }
        format.json { render json: @activo_dato_trabajo_ci, status: :created, location: @activo_dato_trabajo_ci }
      else
        format.html { render action: "new" }
        format.json { render json: @activo_dato_trabajo_ci.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /activo/dato_trabajo_cis/1
  # PUT /activo/dato_trabajo_cis/1.json
  def update
    @activo_dato_trabajo_ci = Activo::DatoTrabajoCi.find(params[:id])
    @activo_ci = Activo::Ci.find(@activo_dato_trabajo_ci.ci_id)
    respond_to do |format|
      if @activo_dato_trabajo_ci.update_attributes(params[:activo_dato_trabajo_ci])
        format.html { redirect_to edit_activo_ci_path(@activo_ci), notice: 'Actualizado Correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @activo_dato_trabajo_ci.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activo/dato_trabajo_cis/1
  # DELETE /activo/dato_trabajo_cis/1.json
  def destroy
    @activo_dato_trabajo_ci = Activo::DatoTrabajoCi.find(params[:id])
    @activo_ci = Activo::Ci.find(@activo_dato_trabajo_ci.ci_id)
     if @activo_dato_trabajo_ci.destroy
      flash[:notice] = 'Eliminado Correctamente'
    end

    respond_to do |format|
      format.html { redirect_to edit_activo_ci_path(@activo_ci) }
      format.json { head :no_content }
    end
  end
  
  def load_data
    @tipo_informacion_trabajo_id= Catalogo::Catalogo.where("tipo_catalogo_id=22").order('orden')
    @fuente_id= Catalogo::Catalogo.where("tipo_catalogo_id=23").order('orden')
  end
end
