class Seguridad::ConfiguracionsController < ApplicationController
  # GET /seguridad/configuracions
  # GET /seguridad/configuracions.json
  def index
    @seguridad_configuracions = Seguridad::Configuracion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @seguridad_configuracions }
    end
  end

  # GET /seguridad/configuracions/1
  # GET /seguridad/configuracions/1.json
  def show
    @seguridad_configuracion = Seguridad::Configuracion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @seguridad_configuracion }
    end
  end

  # GET /seguridad/configuracions/new
  # GET /seguridad/configuracions/new.json
  def new
    @seguridad_configuracion = Seguridad::Configuracion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @seguridad_configuracion }
    end
  end

  # GET /seguridad/configuracions/1/edit
  def edit
    @seguridad_configuracion = Seguridad::Configuracion.find(params[:id])
  end

  # POST /seguridad/configuracions
  # POST /seguridad/configuracions.json
  def create
    @seguridad_configuracion = Seguridad::Configuracion.new(params[:seguridad_configuracion])

    respond_to do |format|
      if @seguridad_configuracion.save
        format.html { redirect_to @seguridad_configuracion, notice: 'Configuracion was successfully created.' }
        format.json { render json: @seguridad_configuracion, status: :created, location: @seguridad_configuracion }
      else
        format.html { render action: "new" }
        format.json { render json: @seguridad_configuracion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /seguridad/configuracions/1
  # PUT /seguridad/configuracions/1.json
  def update
    @seguridad_configuracion = Seguridad::Configuracion.find(params[:id])

    respond_to do |format|
      if @seguridad_configuracion.update_attributes(params[:seguridad_configuracion])
        format.html { redirect_to @seguridad_configuracion, notice: 'Configuracion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @seguridad_configuracion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /seguridad/configuracions/1
  # DELETE /seguridad/configuracions/1.json
  def destroy
    @seguridad_configuracion = Seguridad::Configuracion.find(params[:id])
    @seguridad_configuracion.destroy

    respond_to do |format|
      format.html { redirect_to seguridad_configuracions_url }
      format.json { head :no_content }
    end
  end
end
