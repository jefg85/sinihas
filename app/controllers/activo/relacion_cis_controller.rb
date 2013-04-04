# encoding: utf-8
class Activo::RelacionCisController < ApplicationController
  # GET /activo/relacion_cis
  # GET /activo/relacion_cis.json
  def index
    @activo_relacion_cis = Activo::RelacionCi.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @activo_relacion_cis }
    end
  end

  # GET /activo/relacion_cis/new
  # GET /activo/relacion_cis/new.json
  def new
    @activo_relacion_ci = Activo::RelacionCi.new
    ci_id = params[:ci_id]
    @activo_relacion_ci.ci_id=ci_id
    load_data
    render :layout =>false    
  end

  # GET /activo/relacion_cis/1/edit
  def edit
    @activo_relacion_ci = Activo::RelacionCi.find(params[:id])
    load_data
    render :layout =>false
  end

  # POST /activo/relacion_cis
  # POST /activo/relacion_cis.json
  def create
    @activo_relacion_ci = Activo::RelacionCi.new(params[:activo_relacion_ci])
    @activo_ci = Activo::Ci.find(@activo_relacion_ci.ci_id)
    load_data
    respond_to do |format|
      if @activo_relacion_ci.save
        format.html { redirect_to edit_activo_ci_path(@activo_ci), notice: 'Guardado Correctamente.' }
        format.json { render json: @activo_relacion_ci, status: :created, location: @activo_relacion_ci }
      else
        format.html { render action: "new" }
        format.json { render json: @activo_relacion_ci.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /activo/relacion_cis/1
  # PUT /activo/relacion_cis/1.json
  def update
    @activo_relacion_ci = Activo::RelacionCi.find(params[:id])
    @activo_ci = Activo::Ci.find(@activo_relacion_ci.ci_id)
    load_data
    respond_to do |format|
      if @activo_relacion_ci.update_attributes(params[:activo_relacion_ci])
        format.html { redirect_to edit_activo_ci_path(@activo_ci), notice: 'Actualizado Correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @activo_relacion_ci.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activo/relacion_cis/1
  # DELETE /activo/relacion_cis/1.json
  def destroy
    @activo_relacion_ci = Activo::RelacionCi.find(params[:id])
    @activo_ci = Activo::Ci.find(@activo_relacion_ci.ci_id)
    if @activo_relacion_ci.destroy
      flash[:notice] = 'Eliminado Correctamente'
    end

    respond_to do |format|
      format.html { redirect_to edit_activo_ci_path(@activo_ci) }
      format.json { head :no_content }
    end
  end
  
  def load_data
  	@ci_id = Activo::Ci.where('id<>?',@activo_relacion_ci.ci_id)
  	@catalogo_estado = Catalogo::Catalogo.where("tipo_catalogo_id=24")
  	@tipo = Catalogo::Catalogo.where("tipo_catalogo_id=25")
  end
  
end
