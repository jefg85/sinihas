# encoding: utf-8
class Peticion::PeticionTisController < ApplicationController
  
    def report
    #expediente_id = params[:expediente_id].to_i
    server = Utils::Report.new
    
    url = Seguridad::Menu.where("codigo = 'SHS_PET01'")[0].url
    server.agregar_parametro('prid',params[:id])
    report_data = server.getReport('PDF',url)    
    send_data report_data, :type => server.getContentType('PDF'), :filename => "proveedores.pdf", :disposition => 'inline'
     
  end
  
  def quitarservicio
    id =params[:id]
    servicio_id =params[:servicio_id]
    peticion_servicio = Peticion::PeticionServicioTi.where("peticion_id=#{id} and servicio_id = #{servicio_id}")[0]
    @peticion_peticion_ti = Peticion::PeticionTi.find(id)
     respond_to do |format|
      if peticion_servicio.destroy
        format.html { redirect_to edit_peticion_peticion_ti_path(@peticion_peticion_ti), notice: 'Eliminado Correctamente.' }
      else
        format.html { render action: "edit" }        
      end
    end
    end
  
  def agregarservicio
    @id =params[:id]
    servicio = Peticion::PeticionServicioTi.select(:servicio_id).where("peticion_id = #{@id}")
    ids = Array.new
    servicio.each do |i|
      ids.push(i.servicio_id)   
    end
    if servicio.count > 0
      @servicios = Peticion::ServicioTi.where("id not in (#{ids.join(',').to_s})")
    else
      @servicios = Peticion::ServicioTi.all
    end
    render :layout => false
  end
  
  def seleccionarservicio
    id =params[:id]
    servicio_id =params[:servicio_id]
    servicio = Peticion::PeticionServicioTi.new
    servicio.servicio_id = servicio_id.to_i
    servicio.peticion_id = id.to_i
    servicio.fecha_asignacion = Date.today
     @peticion_peticion_ti = Peticion::PeticionTi.find(id)
     respond_to do |format|
      if servicio.save
        format.html { redirect_to edit_peticion_peticion_ti_path(@peticion_peticion_ti), notice: 'Guardado Correctamente.' }
      else
        format.html { render action: "edit" }        
      end
    end

  end
  
  # GET /peticion/peticion_tis
  # GET /peticion/peticion_tis.json
  def index
    @peticion_peticion_tis = Peticion::PeticionTi.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @peticion_peticion_tis }
    end
  end

  # GET /peticion/peticion_tis/new
  # GET /peticion/peticion_tis/new.json
  def new
    @peticion_peticion_ti = Peticion::PeticionTi.new
    load_data

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @peticion_peticion_ti }
    end
  end

  # GET /peticion/peticion_tis/1/edit
  def edit
    @peticion_peticion_ti = Peticion::PeticionTi.find(params[:id])
    @peticion_servicio_tis = Peticion::ServicioTi.joins(:peticiones).where("peticion_peticion_servicio_tis.peticion_id=?",@peticion_peticion_ti.id)
    load_data
  end

  # POST /peticion/peticion_tis
  # POST /peticion/peticion_tis.json
  def create
    @peticion_peticion_ti = Peticion::PeticionTi.new(params[:peticion_peticion_ti])

    respond_to do |format|
      if @peticion_peticion_ti.save
        format.html { redirect_to edit_peticion_peticion_ti_path(@peticion_peticion_ti), notice: 'Guardado Correctamente.' }
        format.json { render json: @peticion_peticion_ti, status: :created, location: @peticion_peticion_ti }
      else
        format.html { render action: "new" }
        format.json { render json: @peticion_peticion_ti.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /peticion/peticion_tis/1
  # PUT /peticion/peticion_tis/1.json
  def update
    @peticion_peticion_ti = Peticion::PeticionTi.find(params[:id])

    respond_to do |format|
      if @peticion_peticion_ti.update_attributes(params[:peticion_peticion_ti])
        format.html { redirect_to edit_peticion_peticion_ti_path(@peticion_peticion_ti), notice: 'Actualizado Correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @peticion_peticion_ti.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /peticion/peticion_tis/1
  # DELETE /peticion/peticion_tis/1.json
  def destroy
    @peticion_peticion_ti = Peticion::PeticionTi.find(params[:id])
     if @peticion_peticion_ti.destroy
      flash[:notice] = 'Eliminado Correctamente'
    end

    respond_to do |format|
      format.html { redirect_to peticion_peticion_tis_url }
      format.json { head :no_content }
    end
  end
  
  def load_data
    @catalogo = Array.new
    @prioridad= Catalogo::Catalogo.where("tipo_catalogo_id=1")
    @estado= Catalogo::Catalogo.where("tipo_catalogo_id=8")
    @direccion= Catalogo::Catalogo.where("tipo_catalogo_id=18")
    @departamento= Catalogo::Catalogo.where("tipo_catalogo_id=19")
    @seccion= Catalogo::Catalogo.where("tipo_catalogo_id=20")
    @tipo= Catalogo::Catalogo.where("tipo_catalogo_id=21")
    @usuarios = Seguridad::Usuario.all
  end
  
end
