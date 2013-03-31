# encoding: utf-8
class Activo::EstadoCisController < ApplicationController
  
  
   def quitarcategoria
    estado_id =params[:estado_id]
    categoria_id =params[:categoria_id]

    estado_categoria = Activo::EstadoCategoriaCi.where("estado_ci_id=#{estado_id} and categoria_ci_id = #{categoria_id}")[0]
    
    @activo_estado_ci = Activo::EstadoCi.find(estado_id)

     respond_to do |format|
      if estado_categoria.destroy
        format.html { redirect_to edit_activo_estado_ci_path(@activo_estado_ci), notice: 'Eliminado Correctamente.' }
      else
        format.html { render action: "edit" }        
      end
    end
    end
  
  def agregarcategoria
    @id =params[:id]
    estado_categoria = Activo::EstadoCategoriaCi.select(:categoria_ci_id).where("estado_ci_id = #{@id}")
    ids = Array.new
    estado_categoria.each do |i|
      ids.push(i.categoria_ci_id)   
    end
    if estado_categoria.count > 0
      @activo_categoria_cis = Activo::CategoriaCi.where("id not in (#{ids.join(',').to_s})")
    else
      @activo_categoria_cis = Activo::CategoriaCi.all
    end
    render :layout => false
  end
  
  def seleccionarcategoria
    estado_id =params[:estado_id]
    categoria_id =params[:categoria_id]

    estado_categoria = Activo::EstadoCategoriaCi.new
    estado_categoria.categoria_ci_id = categoria_id.to_i
    estado_categoria.estado_ci_id = estado_id.to_i

     @activo_estado_ci = Activo::EstadoCi.find(estado_id)

     respond_to do |format|
      if estado_categoria.save
        format.html { redirect_to edit_activo_estado_ci_path(@activo_estado_ci), notice: 'Guardado Correctamente.' }        
      else
        format.html { render action: "edit" }        
      end
    end

  end
  
  # GET /activo/estado_cis
  # GET /activo/estado_cis.json
  def index
    
    if !params[:prBuscar].nil? && !params[:prBuscar].blank?
      @activo_estado_cis = Activo::EstadoCi.where("nombre like '%#{params[:prBuscar]}%'")
    else
      @activo_estado_cis = Activo::EstadoCi.all
    end 
    
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @activo_estado_cis }
    end
  end

  # GET /activo/estado_cis/new
  # GET /activo/estado_cis/new.json
  def new
    @activo_estado_ci = Activo::EstadoCi.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @activo_estado_ci }
    end
  end

  # GET /activo/estado_cis/1/edit
  def edit
    @activo_estado_ci = Activo::EstadoCi.find(params[:id])
    @activo_categoria_cis = Activo::CategoriaCi.joins(:estados).where("activo_estado_categoria_cis.estado_ci_id=?",@activo_estado_ci.id)
  end
  
  def show
    @activo_estado_ci = Activo::EstadoCi.find(params[:id])
    @activo_categoria_cis = Activo::CategoriaCi.joins(:estados).where("activo_estado_categoria_cis.estado_ci_id=?",@activo_estado_ci.id)
  end

  # POST /activo/estado_cis
  # POST /activo/estado_cis.json
  def create
    @activo_estado_ci = Activo::EstadoCi.new(params[:activo_estado_ci])

    respond_to do |format|
      if @activo_estado_ci.save
        format.html { redirect_to edit_activo_estado_ci_path(@activo_estado_ci), notice: 'Guardado Correctamente.' }
        format.json { render json: @activo_estado_ci, status: :created, location: @activo_estado_ci }
      else
        format.html { render action: "new" }
        format.json { render json: @activo_estado_ci.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /activo/estado_cis/1
  # PUT /activo/estado_cis/1.json
  def update
    @activo_estado_ci = Activo::EstadoCi.find(params[:id])

    respond_to do |format|
      if @activo_estado_ci.update_attributes(params[:activo_estado_ci])
        format.html { redirect_to edit_activo_estado_ci_path(@activo_estado_ci), notice: 'Actualizado Correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @activo_estado_ci.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activo/estado_cis/1
  # DELETE /activo/estado_cis/1.json
  def destroy
    @activo_estado_ci = Activo::EstadoCi.find(params[:id])
    
    estado_categoria = Activo::EstadoCategoriaCi.where("estado_ci_id=#{params[:id]}")
    
    estado_categoria.each do  |i|
      i.destroy
    end
    
     if @activo_estado_ci.destroy
      flash[:notice] = 'Eliminado Correctamente'
    end

    respond_to do |format|
      format.html { redirect_to activo_estado_cis_url }
      format.json { head :no_content }
    end
  end
end
