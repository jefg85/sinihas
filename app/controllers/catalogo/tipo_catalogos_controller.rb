# encoding: utf-8
class Catalogo::TipoCatalogosController < ApplicationController
  # GET /catalogo/tipo_catalogos
  # GET /catalogo/tipo_catalogos.json
  def index
    @catalogo_tipo_catalogos = Catalogo::TipoCatalogo.page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @catalogo_tipo_catalogos }
    end
  end

  # GET /catalogo/tipo_catalogos/new
  # GET /catalogo/tipo_catalogos/new.json
  def new
    @catalogo_tipo_catalogo = Catalogo::TipoCatalogo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @catalogo_tipo_catalogo }
    end
  end

  # GET /catalogo/tipo_catalogos/1/edit
  def edit
    @catalogo_tipo_catalogo = Catalogo::TipoCatalogo.find(params[:id])
    @catalogo_catalogos = Catalogo::Catalogo.where("tipo_catalogo_id = #{@catalogo_tipo_catalogo.id.to_s}").order("orden asc")
  end

  # POST /catalogo/tipo_catalogos
  # POST /catalogo/tipo_catalogos.json
  def create
    @catalogo_tipo_catalogo = Catalogo::TipoCatalogo.new(params[:catalogo_tipo_catalogo])

    respond_to do |format|
      if @catalogo_tipo_catalogo.save
        format.html { redirect_to edit_catalogo_tipo_catalogo_path(@catalogo_tipo_catalogo), notice: 'Guardado Correctamente.' }
        format.json { render json: @catalogo_tipo_catalogo, status: :created, location: @catalogo_tipo_catalogo }
      else
        format.html { render action: "new" }
        format.json { render json: @catalogo_tipo_catalogo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /catalogo/tipo_catalogos/1
  # PUT /catalogo/tipo_catalogos/1.json
  def update
    @catalogo_tipo_catalogo = Catalogo::TipoCatalogo.find(params[:id])

    respond_to do |format|
      if @catalogo_tipo_catalogo.update_attributes(params[:catalogo_tipo_catalogo])
        format.html { redirect_to edit_catalogo_tipo_catalogo_path(@catalogo_tipo_catalogo), notice: 'Guardado Correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @catalogo_tipo_catalogo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /catalogo/tipo_catalogos/1
  # DELETE /catalogo/tipo_catalogos/1.json
  def destroy
    @catalogo_tipo_catalogo = Catalogo::TipoCatalogo.find(params[:id])
    if @catalogo_tipo_catalogo.destroy
      flash[:notice] ='Borrado Correctamente.'
     end

    respond_to do |format|
      format.html { redirect_to catalogo_tipo_catalogos_url }
      format.json { head :no_content }
    end
  end
end
