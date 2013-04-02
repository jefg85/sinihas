# encoding: utf-8
class Activo::ProveedorCisController < ApplicationController
  
   def report
    #expediente_id = params[:expediente_id].to_i
    server = Utils::Report.new
    
    url = Seguridad::Menu.where("codigo = 'SHS_PROV01'")[0].url
    report_data = server.getReport('PDF',url)    
    send_data report_data, :type => server.getContentType('PDF'), :filename => "proveedores.pdf", :disposition => 'inline'
     
  end
  
  # GET /activo/proveedor_cis
  # GET /activo/proveedor_cis.json
  def index
    squery = ""
    
    if !params[:prBuscarNit].nil? && !params[:prBuscarNit].blank?
      squery = "nit LIKE '%#{params[:prBuscarNit]}%'"   
    end
    
    if !params[:prBuscarNombre].nil? && !params[:prBuscarNombre].blank?
      if !squery.blank?
        squery = squery + " AND nombre_comercial LIKE '%#{params[:prBuscarNombre]}%'"  
      else
        squery = "nombre_comercial LIKE '%#{params[:prBuscarNombre]}%'"
      end
    end
    
    if !params[:prTipoProveedor].nil? && !params[:prTipoProveedor].blank?
      if !squery.blank?
        squery = squery + " AND tipo_proveedor_id = #{params[:prTipoProveedor]}"  
      else
        squery = "tipo_proveedor_id = #{params[:prTipoProveedor]}"
      end
    end
    
    if !params[:prBuscarFechaInicioVig].nil? && !params[:prBuscarFechaInicioVig].blank?
      if !squery.blank?
        squery = squery + " AND fecha_inicio_vigencia >= CONVERT(date,'#{params[:prBuscarFechaInicioVig].to_date}',103)"
      else
        squery = "fecha_inicio_vigencia >= CONVERT(date,'#{params[:prBuscarFechaInicioVig].to_date}',103)"  
      end
    end
    
    if !params[:prBuscarFechaFinVig].nil? && !params[:prBuscarFechaFinVig].blank?
      if !squery.blank?
        squery = squery + " AND fecha_fin_vigencia <= CONVERT(date,'#{params[:prBuscarFechaFinVig].to_date}',103)"  
      else
        squery = "fecha_fin_vigencia <= CONVERT(date,'#{params[:prBuscarFechaFinVig].to_date}',103)"  
      end
    end
    
    if !squery.blank?
      @activo_proveedor_cis = Activo::ProveedorCi.where(squery).page(params[:page]).per(5)
      @pr_buscar_nit = params[:prBuscarNit]
      @pr_buscar_nombre = params[:prBuscarNombre]
      @pr_tipo_proveedor = params[:prTipoProveedor] 
      @pr_buscar_fecha_inicio_vig = params[:prBuscarFechaInicioVig]
      @pr_buscar_fecha_fin_vig = params[:prBuscarFechaFinVig]
    else
      @activo_proveedor_cis = Activo::ProveedorCi.page(params[:page]).per(5)  
      @pr_buscar_nit = ""
      @pr_buscar_nombre = ""
      @pr_tipo_proveedor = ""
      @pr_buscar_fecha_inicio_vig = ""
      @pr_buscar_fecha_fin_vig = ""
    end
    load_data
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @activo_proveedor_cis }
    end
  end

  # GET /activo/proveedor_cis/new
  # GET /activo/proveedor_cis/new.json
  def new
    @activo_proveedor_ci = Activo::ProveedorCi.new
    load_data
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @activo_proveedor_ci }
    end
  end

  # GET /activo/proveedor_cis/1/edit
  def edit
    @activo_proveedor_ci = Activo::ProveedorCi.find(params[:id])
    load_data
  end

  # POST /activo/proveedor_cis
  # POST /activo/proveedor_cis.json
  def create
    @activo_proveedor_ci = Activo::ProveedorCi.new(params[:activo_proveedor_ci])

    respond_to do |format|
      if @activo_proveedor_ci.save
        format.html { redirect_to edit_activo_proveedor_ci_path(@activo_proveedor_ci), notice: 'Guardado Correctamente.' }
        format.json { render json: @activo_proveedor_ci, status: :created, location: @activo_proveedor_ci }
      else
        format.html { render action: "new" }
        format.json { render json: @activo_proveedor_ci.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /activo/proveedor_cis/1
  # PUT /activo/proveedor_cis/1.json
  def update
    @activo_proveedor_ci = Activo::ProveedorCi.find(params[:id])

    respond_to do |format|
      if @activo_proveedor_ci.update_attributes(params[:activo_proveedor_ci])
        format.html { redirect_to edit_activo_proveedor_ci_path(@activo_proveedor_ci), notice: 'Actualizado Correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @activo_proveedor_ci.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activo/proveedor_cis/1
  # DELETE /activo/proveedor_cis/1.json
  def destroy
    @activo_proveedor_ci = Activo::ProveedorCi.find(params[:id])
    if @activo_proveedor_ci.destroy
      flash[:notice] = 'Eliminado Correctamente'
    end

    respond_to do |format|
      format.html { redirect_to activo_proveedor_cis_url }
      format.json { head :no_content }
    end
  end
  
  def load_data
    @tipo_proveedor_id= Catalogo::Catalogo.where("tipo_catalogo_id=9")
  end
  
end
