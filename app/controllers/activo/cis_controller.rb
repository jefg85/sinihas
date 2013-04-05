# encoding: utf-8
class Activo::CisController < ApplicationController
  
  def report
    server = Utils::Report.new
    url = Seguridad::Menu.where("codigo = 'SHS_PROV03'")[0].url
    report_data = server.getReport('PDF',url)    
    send_data report_data, :type => server.getContentType('PDF'), :filename => "ci.pdf", :disposition => 'inline'
     
  end
  
  # GET /activo/cis
  # GET /activo/cis.json
  def index
    squery = ""
    
    if !params[:prBuscarCodigo].nil? && !params[:prBuscarCodigo].blank?
      squery = "codigo_inventario LIKE '%#{params[:prBuscarCodigo]}%'"   
    end
    
    if !params[:prBuscarNombre].nil? && !params[:prBuscarNombre].blank?
      if !squery.blank?
        squery = squery + " AND nombre LIKE '%#{params[:prBuscarNombre]}%'"  
      else
        squery = "nombre LIKE '%#{params[:prBuscarNombre]}%'"
      end
    end
    
    if !params[:prBuscarDescripcion].nil? && !params[:prBuscarDescripcion].blank?
      if !squery.blank?
        squery = squery + " AND descripcion LIKE '%#{params[:prBuscarDescripcion]}%'"  
      else
        squery = "descripcion LIKE '%#{params[:prBuscarDescripcion]}%'"
      end
    end
    
    if !params[:prBuscarModVer].nil? && !params[:prBuscarModVer].blank?
      if !squery.blank?
        squery = squery + " AND modelo_version LIKE '%#{params[:prBuscarModVer]}%'"  
      else
        squery = "modelo_version LIKE '%#{params[:prBuscarModVer]}%'"
      end
    end
    
     if !params[:prBuscarFabricador].nil? && !params[:prBuscarFabricador].blank?
      if !squery.blank?
        squery = squery + " AND fabricador_id = #{params[:prBuscarFabricador]}"  
      else
        squery = "fabricador_id = #{params[:prBuscarFabricador]}"
      end
    end
    
    if !params[:prBuscarProveedor].nil? && !params[:prBuscarProveedor].blank?
      if !squery.blank?
        squery = squery + " AND proveedor_id = #{params[:prBuscarProveedor]}"  
      else
        squery = "proveedor_id = #{params[:prBuscarProveedor]}"
      end
    end
    
    if !squery.blank?
      @activo_cis = Activo::Ci.where(squery).page(params[:page]).per(5)
      @pr_buscar_codigo = params[:prBuscarCodigo]
      @pr_buscar_nombre = params[:prBuscarNombre]
      @pr_buscar_descripcion = params[:prBuscarDescripcion] 
      @pr_buscar_modver = params[:prBuscarModVer]
      @pr_buscar_fabricador = params[:prBuscarFabricador]
      @pr_buscar_proveedor = params[:prBuscarProveedor]
    else
      @activo_cis = Activo::Ci.page(params[:page]).per(5) 
      @pr_buscar_codigo = ""
      @pr_buscar_nombre = ""
      @pr_buscar_descripcion = "" 
      @pr_buscar_modver = ""
      @pr_buscar_fabricador = "" 
      @pr_buscar_proveedor = ""
    end
    load_data
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @activo_cis }
    end
  end

  # GET /activo/cis/new
  # GET /activo/cis/new.json
  def new
    @activo_ci = Activo::Ci.new
    load_data

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @activo_ci }
    end
  end

  # GET /activo/cis/1/edit
  def edit
    @activo_ci = Activo::Ci.find(params[:id])
    
    @activo_ciclo_vidas = @activo_ci.ciclo_vida
    @activo_especificacion_cis = @activo_ci.especificaciones
    @activo_relacion_cis = @activo_ci.relaciones
    @activo_dato_trabajo_cis=@activo_ci.datos_trabajo
    
    load_data
  end

  # POST /activo/cis
  # POST /activo/cis.json
  def create
    @activo_ci = Activo::Ci.new(params[:activo_ci])

    respond_to do |format|
      if @activo_ci.save
        format.html { redirect_to edit_activo_ci_path(@activo_ci), notice: 'Guardado Correctamente.' }
        format.json { render json: @activo_ci, status: :created, location: @activo_ci }
      else
        format.html { render action: "new" }
        format.json { render json: @activo_ci.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /activo/cis/1
  # PUT /activo/cis/1.json
  def update
    @activo_ci = Activo::Ci.find(params[:id])

    respond_to do |format|
      if @activo_ci.update_attributes(params[:activo_ci])
        format.html { redirect_to edit_activo_ci_path(@activo_ci), notice: 'Actualizado Correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @activo_ci.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activo/cis/1
  # DELETE /activo/cis/1.json
  def destroy
    @activo_ci = Activo::Ci.find(params[:id])
    if @activo_ci.destroy
      flash[:notice] = 'Eliminado Correctamente'
    end
    
    respond_to do |format|
      format.html { redirect_to activo_cis_url }
      format.json { head :no_content }
    end
  end
  
  def load_data
    @edificio_id= Catalogo::Catalogo.where("tipo_catalogo_id=16")
    @impacto_id= Catalogo::Catalogo.where("tipo_catalogo_id=10")
    @urgencia_id= Catalogo::Catalogo.where("tipo_catalogo_id=11")
    @prioridad_id= Catalogo::Catalogo.where("tipo_catalogo_id=12")
    @categoria_nivel_i_id = Activo::CategoriaCi.all
    @categoria_nivel_ii_id = Activo::CategoriaCi.all
    @categoria_nivel_iii = Activo::CategoriaCi.all
    @fabricador_id=Activo::FabricadorCi.all
    @proveedor_id = Activo::ProveedorCi.all
    @direccion_division_id = Catalogo::Catalogo.where("tipo_catalogo_id=13")
    @departamento_oficina_id = Catalogo::Catalogo.where("tipo_catalogo_id=14")
    @seccion_unidad_id = Catalogo::Catalogo.where("tipo_catalogo_id=15")
  end
end
