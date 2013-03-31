# encoding: utf-8
class Peticion::PeticionServicioTisController < ApplicationController
  # GET /peticion/peticion_servicio_tis
  # GET /peticion/peticion_servicio_tis.json
  def index
    @peticion_peticion_servicio_tis = Peticion::PeticionServicioTi.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @peticion_peticion_servicio_tis }
    end
  end

  # GET /peticion/peticion_servicio_tis/new
  # GET /peticion/peticion_servicio_tis/new.json
  def new
    @peticion_peticion_servicio_ti = Peticion::PeticionServicioTi.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @peticion_peticion_servicio_ti }
    end
  end

  # GET /peticion/peticion_servicio_tis/1/edit
  def edit
    @peticion_peticion_servicio_ti = Peticion::PeticionServicioTi.find(params[:id])
  end

  # POST /peticion/peticion_servicio_tis
  # POST /peticion/peticion_servicio_tis.json
  def create
    @peticion_peticion_servicio_ti = Peticion::PeticionServicioTi.new(params[:peticion_peticion_servicio_ti])

    respond_to do |format|
      if @peticion_peticion_servicio_ti.save
        format.html { redirect_to edit_peticion_peticion_servicio_ti_path(@peticion_peticion_servicio_ti), notice: 'Guardado Correctamente.' }
        format.json { render json: @peticion_peticion_servicio_ti, status: :created, location: @peticion_peticion_servicio_ti }
      else
        format.html { render action: "new" }
        format.json { render json: @peticion_peticion_servicio_ti.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /peticion/peticion_servicio_tis/1
  # PUT /peticion/peticion_servicio_tis/1.json
  def update
    @peticion_peticion_servicio_ti = Peticion::PeticionServicioTi.find(params[:id])

    respond_to do |format|
      if @peticion_peticion_servicio_ti.update_attributes(params[:peticion_peticion_servicio_ti])
        format.html { redirect_to edit_peticion_peticion_servicio_ti_path(@peticion_peticion_servicio_ti), notice: 'Actualizado Correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @peticion_peticion_servicio_ti.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /peticion/peticion_servicio_tis/1
  # DELETE /peticion/peticion_servicio_tis/1.json
  def destroy
    @peticion_peticion_servicio_ti = Peticion::PeticionServicioTi.find(params[:id])
     if @peticion_peticion_servicio_ti.destroy
      flash[:notice] = 'Eliminado Correctamente'
    end

    respond_to do |format|
      format.html { redirect_to peticion_peticion_servicio_tis_url }
      format.json { head :no_content }
    end
  end
end
