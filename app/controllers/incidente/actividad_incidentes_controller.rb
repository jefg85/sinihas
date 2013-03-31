#encoding: utf-8
class Incidente::ActividadIncidentesController < ApplicationController
  # GET /incidente/actividad_incidentes
  # GET /incidente/actividad_incidentes.json
  def index
    @incidente_actividad_incidentes = Incidente::ActividadIncidente.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @incidente_actividad_incidentes }
    end
  end

  # GET /incidente/actividad_incidentes/new
  # GET /incidente/actividad_incidentes/new.json
  def new
    @incidente_actividad_incidente = Incidente::ActividadIncidente.new
    @incidente_actividad_incidente.incidente_id = params[:incidente_id].to_i
    load_data
    render :layout => false
  end

  # GET /incidente/actividad_incidentes/1/edit
  def edit
    @incidente_actividad_incidente = Incidente::ActividadIncidente.find(params[:id])
    load_data
    render :layout => false
  end

  # POST /incidente/actividad_incidentes
  # POST /incidente/actividad_incidentes.json
  def create
    @incidente_actividad_incidente = Incidente::ActividadIncidente.new(params[:incidente_actividad_incidente])

    respond_to do |format|
      if @incidente_actividad_incidente.save
        format.html { redirect_to "/incidente/incidentes/#{@incidente_actividad_incidente.incidente_id.to_s}/edit", notice: 'Guardado Correctamente.' }
        format.json { render json: @incidente_actividad_incidente, status: :created, location: @incidente_actividad_incidente }
      else
        format.html { render action: "new" }
        format.json { render json: @incidente_actividad_incidente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /incidente/actividad_incidentes/1
  # PUT /incidente/actividad_incidentes/1.json
  def update
    @incidente_actividad_incidente = Incidente::ActividadIncidente.find(params[:id])

    respond_to do |format|
      if @incidente_actividad_incidente.update_attributes(params[:incidente_actividad_incidente])
        format.html { redirect_to "/incidente/incidentes/#{@incidente_actividad_incidente.incidente_id.to_s}/edit", notice: 'Actualizado Correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @incidente_actividad_incidente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incidente/actividad_incidentes/1
  # DELETE /incidente/actividad_incidentes/1.json
  def destroy
    @incidente_actividad_incidente = Incidente::ActividadIncidente.find(params[:id])
     if @incidente_actividad_incidente.destroy
      flash[:notice] = 'Eliminado Correctamente'
    end

    respond_to do |format|
      format.html { redirect_to incidente_actividad_incidentes_url }
      format.json { head :no_content }
    end
  end
  
  def load_data
    @ci_id = Activo::Ci.all
    @usuarios = Seguridad::Usuario.all
    @catalogo_estado = Catalogo::Catalogo.where("tipo_catalogo_id=5")
  end
  
end
