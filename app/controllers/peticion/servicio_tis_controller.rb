# encoding: utf-8
class Peticion::ServicioTisController < ApplicationController
  
   def report
    expediente_id = params[:expediente_id].to_i
    
    params_util = Utils::FuncionesParametros.new
    
    servidor_reporte = params_util.obtenerParametro('101')
    user_servidor = params_util.obtenerParametro('102')
    pass_servidor = params_util.obtenerParametro('103')
    
    server = Utils::Report.new(servidor_reporte,user_servidor,pass_servidor)
    
    server.agregar_parametro('pPersona',expediente_id)
    server.agregar_parametro('pUsuario',current_usuario.username)
    server.agregar_parametro('pEstablecimiento',get_current_establecimiento_id.to_s)
    
    url = Seguridad::Recurso.select(:url).where("codigo='FLM_HIS001'")[0].url
        
    report_data = server.getReport('PDF',url)    
    send_data report_data, :type => server.getContentType('PDF'), :filename => "paciente_id_#{expediente_id}.pdf", :disposition => 'inline'
     
  end
  
  # GET /peticion/servicio_tis
  # GET /peticion/servicio_tis.json
  def index
    @peticion_servicio_tis = Peticion::ServicioTi.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @peticion_servicio_tis }
    end
  end

  # GET /peticion/servicio_tis/new
  # GET /peticion/servicio_tis/new.json
  def new
    @peticion_servicio_ti = Peticion::ServicioTi.new
    load_data

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @peticion_servicio_ti }
    end
  end

  # GET /peticion/servicio_tis/1/edit
  def edit
    @peticion_servicio_ti = Peticion::ServicioTi.find(params[:id])
    load_data
  end

  # POST /peticion/servicio_tis
  # POST /peticion/servicio_tis.json
  def create
    @peticion_servicio_ti = Peticion::ServicioTi.new(params[:peticion_servicio_ti])

    respond_to do |format|
      if @peticion_servicio_ti.save
        format.html { redirect_to edit_peticion_servicio_ti_path(@peticion_servicio_ti), notice: 'Guardado Correctamente.' }
        format.json { render json: @peticion_servicio_ti, status: :created, location: @peticion_servicio_ti }
      else
        format.html { render action: "new" }
        format.json { render json: @peticion_servicio_ti.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /peticion/servicio_tis/1
  # PUT /peticion/servicio_tis/1.json
  def update
    @peticion_servicio_ti = Peticion::ServicioTi.find(params[:id])

    respond_to do |format|
      if @peticion_servicio_ti.update_attributes(params[:peticion_servicio_ti])
        format.html { redirect_to edit_peticion_servicio_ti_path(@peticion_servicio_ti), notice: 'Actualizado Correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @peticion_servicio_ti.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /peticion/servicio_tis/1
  # DELETE /peticion/servicio_tis/1.json
  def destroy
    @peticion_servicio_ti = Peticion::ServicioTi.find(params[:id])
     if @peticion_servicio_ti.destroy
      flash[:notice] = 'Eliminado Correctamente'
    end

    respond_to do |format|
      format.html { redirect_to peticion_servicio_tis_url }
      format.json { head :no_content }
    end
  end

def load_data
  @catalogo_categoria = Catalogo::Catalogo.where("tipo_catalogo_id=6 and activo=1")
  @catalogo_estado = Catalogo::Catalogo.where("tipo_catalogo_id=7 and activo=1")
  @catalogo_servicio = Peticion::ServicioTi.all
  @ci_id = Activo::Ci.all
end

end
