# encoding: utf-8
class Seguridad::PermisosController < ApplicationController
  # GET /seguridad/permisos
  # GET /seguridad/permisos.json
  def index
    @seguridad_permisos = Seguridad::Permiso.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @seguridad_permisos }
    end
  end

  # GET /seguridad/permisos/1
  # GET /seguridad/permisos/1.json
  def show
    @seguridad_permiso = Seguridad::Permiso.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @seguridad_permiso }
    end
  end

  # GET /seguridad/permisos/new
  # GET /seguridad/permisos/new.json
  def new
    @seguridad_permiso = Seguridad::Permiso.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @seguridad_permiso }
    end
  end

  # GET /seguridad/permisos/1/edit
  def edit
    @seguridad_permiso = Seguridad::Permiso.find(params[:id])
  end

  # POST /seguridad/permisos
  # POST /seguridad/permisos.json
  def create
    @seguridad_permiso = Seguridad::Permiso.new(params[:seguridad_permiso])

    respond_to do |format|
      if @seguridad_permiso.save
        format.html { redirect_to @seguridad_permiso, notice: 'Permiso was successfully created.' }
        format.json { render json: @seguridad_permiso, status: :created, location: @seguridad_permiso }
      else
        format.html { render action: "new" }
        format.json { render json: @seguridad_permiso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /seguridad/permisos/1
  # PUT /seguridad/permisos/1.json
  def update
    @seguridad_permiso = Seguridad::Permiso.find(params[:id])

    respond_to do |format|
      if @seguridad_permiso.update_attributes(params[:seguridad_permiso])
        format.html { redirect_to @seguridad_permiso, notice: 'Permiso was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @seguridad_permiso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /seguridad/permisos/1
  # DELETE /seguridad/permisos/1.json
  def destroy
    @seguridad_permiso = Seguridad::Permiso.find(params[:id])
    @seguridad_permiso.destroy

    respond_to do |format|
      format.html { redirect_to seguridad_permisos_url }
      format.json { head :no_content }
    end
  end
end
