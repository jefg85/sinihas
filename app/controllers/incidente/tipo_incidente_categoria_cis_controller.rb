# encoding: utf-8
class Incidente::TipoIncidenteCategoriaCisController < ApplicationController
  # GET /incidente/tipo_incidente_categoria_cis
  # GET /incidente/tipo_incidente_categoria_cis.json
  def index
    @incidente_tipo_incidente_categoria_cis = Incidente::TipoIncidenteCategoriaCi.page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @incidente_tipo_incidente_categoria_cis }
    end
  end

  # GET /incidente/tipo_incidente_categoria_cis/new
  # GET /incidente/tipo_incidente_categoria_cis/new.json
  def new
    @incidente_tipo_incidente_categoria_ci = Incidente::TipoIncidenteCategoriaCi.new
    load_data

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @incidente_tipo_incidente_categoria_ci }
    end
  end

  # GET /incidente/tipo_incidente_categoria_cis/1/edit
  def edit
    @incidente_tipo_incidente_categoria_ci = Incidente::TipoIncidenteCategoriaCi.find(params[:id])
    load_data
  end

  # POST /incidente/tipo_incidente_categoria_cis
  # POST /incidente/tipo_incidente_categoria_cis.json
  def create
    @incidente_tipo_incidente_categoria_ci = Incidente::TipoIncidenteCategoriaCi.new(params[:incidente_tipo_incidente_categoria_ci])

    respond_to do |format|
      if @incidente_tipo_incidente_categoria_ci.save
        format.html { redirect_to edit_incidente_tipo_incidente_categoria_ci_path(@incidente_tipo_incidente_categoria_ci), notice: 'Guardado Correctamente.' }
        format.json { render json: @incidente_tipo_incidente_categoria_ci, status: :created, location: @incidente_tipo_incidente_categoria_ci }
      else
        format.html { render action: "new" }
        format.json { render json: @incidente_tipo_incidente_categoria_ci.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /incidente/tipo_incidente_categoria_cis/1
  # PUT /incidente/tipo_incidente_categoria_cis/1.json
  def update
    @incidente_tipo_incidente_categoria_ci = Incidente::TipoIncidenteCategoriaCi.find(params[:id])

    respond_to do |format|
      if @incidente_tipo_incidente_categoria_ci.update_attributes(params[:incidente_tipo_incidente_categoria_ci])
        format.html { redirect_to edit_incidente_tipo_incidente_categoria_ci_path(@incidente_tipo_incidente_categoria_ci), notice: 'Guardado Correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @incidente_tipo_incidente_categoria_ci.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incidente/tipo_incidente_categoria_cis/1
  # DELETE /incidente/tipo_incidente_categoria_cis/1.json
  def destroy
    @incidente_tipo_incidente_categoria_ci = Incidente::TipoIncidenteCategoriaCi.find(params[:id])
     if @incidente_tipo_incidente_categoria_ci.destroy
      flash[:notice] = 'Eliminado Correctamente'
    end

    respond_to do |format|
      format.html { redirect_to incidente_tipo_incidente_categoria_cis_url }
      format.json { head :no_content }
    end
  end

def load_data
 @categorias = Activo::CategoriaCi.select("id, descripcion_corta").order("descripcion_corta")
 @catalogo_estado = Catalogo::Catalogo.where("tipo_catalogo_id=8 and activo=1")
end

end
