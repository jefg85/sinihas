# encoding: utf-8
class Activo::PropiedadEspecificaCisController < ApplicationController
  
  
  def quitarcategoria
    id =params[:id]
    categoria_id =params[:categoria_id]
    categoria = Activo::PropiedadEspecificaCategoriaCi.where("prop_espc_ci=#{id} and categoria_ci_id = #{categoria_id}")[0]
    @activo_propiedad_especifica_ci = Activo::PropiedadEspecificaCi.find(id)
     respond_to do |format|
      if categoria.destroy
        format.html { redirect_to edit_activo_propiedad_especifica_ci_path(@activo_propiedad_especifica_ci), notice: 'Eliminado Correctamente.' }
      else
        format.html { render action: "edit" }        
      end
    end
    end
  
  def agregarcategoria
    @id =params[:id]
    categoria = Activo::PropiedadEspecificaCategoriaCi.select(:categoria_ci_id).where("prop_espc_ci = #{@id}")
    ids = Array.new
    categoria.each do |i|
      ids.push(i.categoria_ci_id)   
    end
    if categoria.count > 0
      @activo_categoria_cis = Activo::CategoriaCi.where("id not in (#{ids.join(',').to_s})")
    else
      @activo_categoria_cis = Activo::CategoriaCi.all
    end
    render :layout => false
  end
  
  def seleccionarcategoria
    id =params[:id]
    categoria_id =params[:categoria_id]
    categoria = Activo::PropiedadEspecificaCategoriaCi.new
    categoria.categoria_ci_id = categoria_id.to_i
    categoria.prop_espc_ci = id.to_i
     @activo_propiedad_especifica_ci = Activo::PropiedadEspecificaCi.find(id)
     respond_to do |format|
      if categoria.save
        format.html { redirect_to edit_activo_propiedad_especifica_ci_path(@activo_propiedad_especifica_ci), notice: 'Guardado Correctamente.' }        
      else
        format.html { render action: "edit" }        
      end
    end

  end
  
  # GET /activo/propiedad_especifica_cis
  # GET /activo/propiedad_especifica_cis.json
  def index
    
    if !params[:prBuscar].nil? && !params[:prBuscar].blank?
      @activo_propiedad_especifica_cis = Activo::PropiedadEspecificaCi.where("nombre_campo like '%#{params[:prBuscar]}%'")
    else
      @activo_propiedad_especifica_cis = Activo::PropiedadEspecificaCi.all
    end 

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @activo_propiedad_especifica_cis }
    end
  end

  # GET /activo/propiedad_especifica_cis/new
  # GET /activo/propiedad_especifica_cis/new.json
  def new
    @activo_propiedad_especifica_ci = Activo::PropiedadEspecificaCi.new
    load_data
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @activo_propiedad_especifica_ci }
    end
  end

  # GET /activo/propiedad_especifica_cis/1/edit
  def edit
    @activo_propiedad_especifica_ci = Activo::PropiedadEspecificaCi.find(params[:id])
    @activo_categoria_cis = Activo::CategoriaCi.joins(:propiedades).where("activo_propiedad_especifica_categoria_cis.prop_espc_ci=?",@activo_propiedad_especifica_ci.id)
    load_data
  end
  
  def show
    @activo_propiedad_especifica_ci = Activo::PropiedadEspecificaCi.find(params[:id])
    @activo_categoria_cis = Activo::CategoriaCi.joins(:propiedades).where("activo_propiedad_especifica_categoria_cis.prop_espc_ci=?",@activo_propiedad_especifica_ci.id)
    load_data
  end

  # POST /activo/propiedad_especifica_cis
  # POST /activo/propiedad_especifica_cis.json
  def create
    @activo_propiedad_especifica_ci = Activo::PropiedadEspecificaCi.new(params[:activo_propiedad_especifica_ci])

    respond_to do |format|
      if @activo_propiedad_especifica_ci.save
        format.html { redirect_to edit_activo_propiedad_especifica_ci_path(@activo_propiedad_especifica_ci), notice: 'Guardado Correctamente.' }
        format.json { render json: @activo_propiedad_especifica_ci, status: :created, location: @activo_propiedad_especifica_ci }
      else
        format.html { render action: "new" }
        format.json { render json: @activo_propiedad_especifica_ci.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /activo/propiedad_especifica_cis/1
  # PUT /activo/propiedad_especifica_cis/1.json
  def update
    @activo_propiedad_especifica_ci = Activo::PropiedadEspecificaCi.find(params[:id])

    respond_to do |format|
      if @activo_propiedad_especifica_ci.update_attributes(params[:activo_propiedad_especifica_ci])
        format.html { redirect_to edit_activo_propiedad_especifica_ci_path(@activo_propiedad_especifica_ci), notice: 'Actualizado Correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @activo_propiedad_especifica_ci.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activo/propiedad_especifica_cis/1
  # DELETE /activo/propiedad_especifica_cis/1.json
  def destroy
    @activo_propiedad_especifica_ci = Activo::PropiedadEspecificaCi.find(params[:id])
    
    categoria = Activo::PropiedadEspecificaCategoriaCi.where("prop_espc_ci=#{params[:id]}")
    
    categoria.each do  |i|
      i.destroy
    end
    
    if @activo_propiedad_especifica_ci.destroy
      flash[:notice] = 'Eliminado Correctamente'
    end

    respond_to do |format|
      format.html { redirect_to activo_propiedad_especifica_cis_url }
      format.json { head :no_content }
    end
  end
  
  def load_data
    @tipo_campo= Catalogo::Catalogo.where("tipo_catalogo_id=17")
  end
  
  
end
