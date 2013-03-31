# encoding: utf-8
class Activo::CicloVidasController < ApplicationController
  # GET /activo/ciclo_vidas
  # GET /activo/ciclo_vidas.json
  def index
    @activo_ciclo_vidas = Activo::CicloVida.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @activo_ciclo_vidas }
    end
  end

  # GET /activo/ciclo_vidas/new
  # GET /activo/ciclo_vidas/new.json
  def new
    @activo_ciclo_vida = Activo::CicloVida.new
    ci_id = params[:ci_id]
    @activo_ciclo_vida.ci_id=ci_id
    load_data
    render :layout =>false
  end

  # GET /activo/ciclo_vidas/1/edit
  def edit
    @activo_ciclo_vida = Activo::CicloVida.find(params[:id])
    load_data
    render :layout =>false
  end

  # POST /activo/ciclo_vidas
  # POST /activo/ciclo_vidas.json
  def create
    @activo_ciclo_vida = Activo::CicloVida.new(params[:activo_ciclo_vida])

    @activo_ci = Activo::Ci.find(@activo_ciclo_vida.ci_id)

    respond_to do |format|
      if @activo_ciclo_vida.save
        format.html { redirect_to edit_activo_ci_path(@activo_ci), notice: 'Guardado Correctamente.' }
        format.json { render json: @activo_ciclo_vida, status: :created, location: @activo_ciclo_vida }
      else
        format.html { render action: "new" }
        format.json { render json: @activo_ciclo_vida.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /activo/ciclo_vidas/1
  # PUT /activo/ciclo_vidas/1.json
  def update
    @activo_ciclo_vida = Activo::CicloVida.find(params[:id])
    @activo_ci = Activo::Ci.find(@activo_ciclo_vida.ci_id)
    
    respond_to do |format|
      if @activo_ciclo_vida.update_attributes(params[:activo_ciclo_vida])
        format.html { redirect_to edit_activo_ci_path(@activo_ci), notice: 'Actualizado Correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @activo_ciclo_vida.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activo/ciclo_vidas/1
  # DELETE /activo/ciclo_vidas/1.json
  def destroy
    @activo_ciclo_vida = Activo::CicloVida.find(params[:id])
    @activo_ci = Activo::Ci.find(@activo_ciclo_vida.ci_id)
    
    if @activo_ciclo_vida.destroy
      flash[:notice] = 'Eliminado Correctamente'
    end

    respond_to do |format|
      format.html { redirect_to edit_activo_ci_path(@activo_ci) }
      format.json { head :no_content }
    end
  end
  
  def load_data
    @estado_categoria_ci_id= Activo::EstadoCategoriaCi.select('activo_estado_categoria_cis.id,activo_estado_cis.nombre as nombre_estado').joins(:estado)
    @responsable_id = Seguridad::Usuario.all
  end
  
end
