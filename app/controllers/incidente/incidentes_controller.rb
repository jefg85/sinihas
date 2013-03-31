# encoding: utf-8
class Incidente::IncidentesController < ApplicationController
  
    def report
    #expediente_id = params[:expediente_id].to_i
    server = Utils::Report.new
    
    url = Seguridad::Menu.where("codigo = 'SHS_INCI01'")[0].url
    server.agregar_parametro('prid',params[:id])
    report_data = server.getReport('PDF',url)    
    send_data report_data, :type => server.getContentType('PDF'), :filename => "proveedores.pdf", :disposition => 'inline'
     
  end
  
  # GET /incidente/incidentes
  # GET /incidente/incidentes.json
  def index
    @incidente_incidentes = Incidente::Incidente.all   
  end

  # GET /incidente/incidentes/new
  # GET /incidente/incidentes/new.json
  def new    
    @incidente_incidente = Incidente::Incidente.new
    load_data
  end

  # GET /incidente/incidentes/1/edit
  def edit    
    @incidente_incidente = Incidente::Incidente.find(params[:id])
    load_data
  end

  # POST /incidente/incidentes
  # POST /incidente/incidentes.json
  def create
    @incidente_incidente = Incidente::Incidente.new(params[:incidente_incidente])

    respond_to do |format|
      if @incidente_incidente.save
        format.html { redirect_to edit_incidente_incidente_path(@incidente_incidente), notice: 'Guardado Correctamente.' }
        format.json { render json: @incidente_incidente, status: :created, location: @incidente_incidente }
      else
        format.html { render action: "new" }
        format.json { render json: @incidente_incidente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /incidente/incidentes/1
  # PUT /incidente/incidentes/1.json
  def update
    @incidente_incidente = Incidente::Incidente.find(params[:id])
        
    respond_to do |format|
      if @incidente_incidente.update_attributes(params[:incidente_incidente])
        redirect_to "/incidente/incidentes/#{@incidente_incidente.id.to_s}/edit" , notice: 'Guardado Correctamente.'
      else
        redirect_to edit_incidente_incidente_path(@incidente_incidente)        
      end
    end
  end

  # DELETE /incidente/incidentes/1
  # DELETE /incidente/incidentes/1.json
  def destroy
    @incidente_incidente = Incidente::Incidente.find(params[:id])
     if @incidente_incidente.destroy
      flash[:notice] = 'Eliminado Correctamente'
    end

    respond_to do |format|
      format.html { redirect_to incidente_incidentes_url }
      format.json { head :no_content }
    end
  end


def load_data
  @nombre_informado=""
  @catalogo_prioridad = Catalogo::Catalogo.where("tipo_catalogo_id=1")
  @catalogo_grupo = Catalogo::Catalogo.where("tipo_catalogo_id=3")
  @catalogo_impacto = Catalogo::Catalogo.where("tipo_catalogo_id=4")
  @catalogo_estado = Catalogo::Catalogo.where("tipo_catalogo_id=5")
  @tipo_incidente = Incidente::TipoIncidenteCategoriaCi.all
  @ci =Activo::Ci.all

  if @incidente_incidente.new_record?
    
    @incidente_incidente.informado_por = current_usuario.id
    @incidente_incidente.fecha_informe = Date.today
    usuario = Seguridad::Usuario.find(current_usuario.id)
    @nombre_informado = usuario.nombres + ' ' + usuario.apellidos
    
  else
    usuario = Seguridad::Usuario.find(@incidente_incidente.informado_por)
    @nombre_informado = usuario.nombres + ' ' + usuario.apellidos
    @incidente_actividad_incidentes = Incidente::ActividadIncidente.where("incidente_id=#{@incidente_incidente.id}")
  end

    
  
end

end
