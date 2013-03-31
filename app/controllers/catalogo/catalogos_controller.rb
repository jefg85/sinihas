# encoding: utf-8
class Catalogo::CatalogosController < ApplicationController
  # GET /catalogo/catalogos
  # GET /catalogo/catalogos.json
  def index
    @catalogo_catalogos = Catalogo::Catalogo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @catalogo_catalogos }
    end
  end

  # GET /catalogo/catalogos/new
  # GET /catalogo/catalogos/new.json
  def new
    @catalogo_catalogo = Catalogo::Catalogo.new
    @catalogo_catalogo.tipo_catalogo_id = params[:tipo_id]
    render :layout => false
  end

  # GET /catalogo/catalogos/1/edit
  def edit
    @catalogo_catalogo = Catalogo::Catalogo.find(params[:id])
    render :layout => false
  end

  # POST /catalogo/catalogos
  # POST /catalogo/catalogos.json
  def create
    @catalogo_catalogo = Catalogo::Catalogo.new(params[:catalogo_catalogo])

    @catalogo_tipo_catalogo = Catalogo::TipoCatalogo.find(@catalogo_catalogo.tipo_catalogo_id)

    respond_to do |format|
      if @catalogo_catalogo.save
        format.html { redirect_to edit_catalogo_tipo_catalogo_path(@catalogo_tipo_catalogo), notice: 'Guardado Correctamente.' }
        format.json { render json: @catalogo_catalogo, status: :created, location: @catalogo_catalogo }
      else
        format.html { render action: "new" }
        format.json { render json: @catalogo_catalogo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /catalogo/catalogos/1
  # PUT /catalogo/catalogos/1.json
  def update
    @catalogo_catalogo = Catalogo::Catalogo.find(params[:id])

    @catalogo_tipo_catalogo = Catalogo::TipoCatalogo.find(@catalogo_catalogo.tipo_catalogo_id)

    respond_to do |format|
      if @catalogo_catalogo.update_attributes(params[:catalogo_catalogo])
        format.html { redirect_to edit_catalogo_tipo_catalogo_path(@catalogo_tipo_catalogo), notice: 'Guardado Correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @catalogo_catalogo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /catalogo/catalogos/1
  # DELETE /catalogo/catalogos/1.json
  def destroy
    @catalogo_catalogo = Catalogo::Catalogo.find(params[:id])
    @catalogo_tipo_catalogo = Catalogo::TipoCatalogo.find(@catalogo_catalogo.tipo_catalogo_id)
    @catalogo_catalogo.destroy

    respond_to do |format|
      format.html { redirect_to edit_catalogo_tipo_catalogo_path(@catalogo_tipo_catalogo), notice: 'Borrado Correctamente.' }
      format.json { head :no_content }
    end
  end
end
