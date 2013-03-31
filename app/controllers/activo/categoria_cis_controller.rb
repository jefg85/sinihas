# encoding: utf-8
class Activo::CategoriaCisController < ApplicationController
  # GET /activo/categoria_cis
  # GET /activo/categoria_cis.json
  def index
    
    if !params[:prBuscar].nil? && !params[:prBuscar].blank?
      @activo_categoria_cis = Activo::CategoriaCi.where("descripcion_corta like '%#{params[:prBuscar]}%'").order('posicion')
    else
      @activo_categoria_cis = Activo::CategoriaCi.all
    end 
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @activo_categoria_cis }
    end
  end

  # GET /activo/categoria_cis/new
  # GET /activo/categoria_cis/new.json
  def new
    @activo_categoria_ci = Activo::CategoriaCi.new
    load_data

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @activo_categoria_ci }
    end
  end

  # GET /activo/categoria_cis/1/edit
  def edit
    @activo_categoria_ci = Activo::CategoriaCi.find(params[:id])
    load_data
  end
  
  def show
    @activo_categoria_ci = Activo::CategoriaCi.find(params[:id])
    @tipo =""
      if @activo_categoria_ci.tipo==1
        @tipo = 'Categoría General'
      elsif @activo_categoria_ci.tipo==2
        @tipo = 'SubCategoría'
      elsif @activo_categoria_ci.tipo==3
        @tipo = 'SubSubCategoría'
      end
      
    load_data
  end

  # POST /activo/categoria_cis
  # POST /activo/categoria_cis.json
  def create
    @activo_categoria_ci = Activo::CategoriaCi.new(params[:activo_categoria_ci])

    respond_to do |format|
      if @activo_categoria_ci.save
        format.html { redirect_to edit_activo_categoria_ci_path(@activo_categoria_ci), notice: 'Guardado Correctamente.' }
        format.json { render json: @activo_categoria_ci, status: :created, location: @activo_categoria_ci }
      else
        format.html { render action: "new" }
        format.json { render json: @activo_categoria_ci.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /activo/categoria_cis/1
  # PUT /activo/categoria_cis/1.json
  def update
    @activo_categoria_ci = Activo::CategoriaCi.find(params[:id])

    respond_to do |format|
      if @activo_categoria_ci.update_attributes(params[:activo_categoria_ci])
        format.html { redirect_to edit_activo_categoria_ci_path(@activo_categoria_ci), notice: 'Actualizado Correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @activo_categoria_ci.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activo/categoria_cis/1
  # DELETE /activo/categoria_cis/1.json
  def destroy
    @activo_categoria_ci = Activo::CategoriaCi.find(params[:id])
     if @activo_categoria_ci.destroy
      flash[:notice] = 'Eliminado Correctamente'
    end

    respond_to do |format|
      format.html { redirect_to activo_categoria_cis_url }
      format.json { head :no_content }
    end
  end
  
  def load_data
    if  @activo_categoria_ci.new_record?
      @nivel = Activo::CategoriaCi.all
    else
      @nivel = Activo::CategoriaCi.where('id <> ?',@activo_categoria_ci.id)
    end
  end
end
