# encoding: utf-8
class Seguridad::ModulosController < ApplicationController
  # GET /seguridad/modulos
  # GET /seguridad/modulos.json
  def index
    @seguridad_modulos = Seguridad::Modulo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @seguridad_modulos }
    end
  end

  # GET /seguridad/modulos/1
  # GET /seguridad/modulos/1.json
  def show
    @seguridad_modulo = Seguridad::Modulo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @seguridad_modulo }
    end
  end

  # GET /seguridad/modulos/new
  # GET /seguridad/modulos/new.json
  def new
    @seguridad_modulo = Seguridad::Modulo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @seguridad_modulo }
    end
  end

  # GET /seguridad/modulos/1/edit
  def edit
    @seguridad_modulo = Seguridad::Modulo.find(params[:id])
  end

  # POST /seguridad/modulos
  # POST /seguridad/modulos.json
  def create
    @seguridad_modulo = Seguridad::Modulo.new(params[:seguridad_modulo])

    respond_to do |format|
      if @seguridad_modulo.save
        format.html { redirect_to @seguridad_modulo, notice: 'Modulo was successfully created.' }
        format.json { render json: @seguridad_modulo, status: :created, location: @seguridad_modulo }
      else
        format.html { render action: "new" }
        format.json { render json: @seguridad_modulo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /seguridad/modulos/1
  # PUT /seguridad/modulos/1.json
  def update
    @seguridad_modulo = Seguridad::Modulo.find(params[:id])

    respond_to do |format|
      if @seguridad_modulo.update_attributes(params[:seguridad_modulo])
        format.html { redirect_to @seguridad_modulo, notice: 'Modulo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @seguridad_modulo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /seguridad/modulos/1
  # DELETE /seguridad/modulos/1.json
  def destroy
    @seguridad_modulo = Seguridad::Modulo.find(params[:id])
    @seguridad_modulo.destroy

    respond_to do |format|
      format.html { redirect_to seguridad_modulos_url }
      format.json { head :no_content }
    end
  end
end
