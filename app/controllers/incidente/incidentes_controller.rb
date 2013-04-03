# encoding: utf-8
class Incidente::IncidentesController < ApplicationController
  
    
def rpt_tipo
	@tipo = Incidente::TipoIncidenteCategoriaCi.all
end

def rpt_tipo_resumen
end

def rpt_estado
	@catalogo_estado = Catalogo::Catalogo.where("tipo_catalogo_id=5")= 
end

def rpt_estado_resumen
end

def rpt_actividades_usuario
	@usuarios = Seguridad::Usuario.all
end

def rpt_actividades_estado
	@catalogo_estado = Catalogo::Catalogo.where("tipo_catalogo_id=5")
end    
    
  def report_tipo    
    server = Utils::Report.new    
    url = Seguridad::Menu.where("codigo = 'SHS_INCI10'")[0].url
    server.agregar_parametro('prtipo',params[:tipo])
    server.agregar_parametro('prinicio',params[:inicio])
    server.agregar_parametro('prfin',params[:fin])
    report_data = server.getReport('PDF',url)    
    send_data report_data, :type => server.getContentType('PDF'), :filename => "report_tipo.pdf", :disposition => 'inline'     
  end
  
  def report_tipo_resumen    
    server = Utils::Report.new    
    url = Seguridad::Menu.where("codigo = 'SHS_INCI11'")[0].url    
    server.agregar_parametro('prinicio',params[:inicio])
    server.agregar_parametro('prfin',params[:fin])
    report_data = server.getReport('PDF',url)    
    send_data report_data, :type => server.getContentType('PDF'), :filename => "report_tipo_resumen.pdf", :disposition => 'inline'     
  end
  
  def report_estado    
    server = Utils::Report.new    
    url = Seguridad::Menu.where("codigo = 'SHS_INCI12'")[0].url
    server.agregar_parametro('prestado',params[:estado])
    server.agregar_parametro('prinicio',params[:inicio])
    server.agregar_parametro('prfin',params[:fin])
    report_data = server.getReport('PDF',url)    
    send_data report_data, :type => server.getContentType('PDF'), :filename => "report_estado.pdf", :disposition => 'inline'     
  end
  
  def report_estado_resumen    
    server = Utils::Report.new    
    url = Seguridad::Menu.where("codigo = 'SHS_INCI13'")[0].url    
    server.agregar_parametro('prinicio',params[:inicio])
    server.agregar_parametro('prfin',params[:fin])
    report_data = server.getReport('PDF',url)    
    send_data report_data, :type => server.getContentType('PDF'), :filename => "report_estado_resumen.pdf", :disposition => 'inline'     
  end
    
  def report_actividades_usuario    
    server = Utils::Report.new    
    url = Seguridad::Menu.where("codigo = 'SHS_INCI14'")[0].url
    server.agregar_parametro('prusuario',params[:usuario])
    server.agregar_parametro('prinicio',params[:inicio])
    server.agregar_parametro('prfin',params[:fin])
    report_data = server.getReport('PDF',url)    
    send_data report_data, :type => server.getContentType('PDF'), :filename => "report_actividades_usuario.pdf", :disposition => 'inline'     
  end
 
 def report_actividades_estado    
    server = Utils::Report.new    
    url = Seguridad::Menu.where("codigo = 'SHS_INCI15'")[0].url
    server.agregar_parametro('prestado',params[:estado])    
    server.agregar_parametro('prinicio',params[:inicio])
    server.agregar_parametro('prfin',params[:fin])
    report_data = server.getReport('PDF',url)    
    send_data report_data, :type => server.getContentType('PDF'), :filename => "report_actividades_estado.pdf", :disposition => 'inline'     
  end
  
  
  def reportes
  
  conn = ActiveRecord::Base.connection
  @reportes = conn.select_all "select m.* from seguridad_menus m 
        inner join seguridad_rol_menus rm
        on m.id = rm.menu_id
        inner join seguridad_permisos p
        on p.role_id = rm.rol_id
        where m.tipo = 'R' m.modulo_id = 5 
        and p.usuario_id= #{current_usuario.id.to_s}
        order by m.orden"
  
  end
  
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
