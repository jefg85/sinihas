# encoding: utf-8
class Activo::FabricadorCisController < ApplicationController
  
   def report
    server = Utils::Report.new
    url = Seguridad::Menu.where("codigo = 'SHS_PROV02'")[0].url
    report_data = server.getReport('PDF',url)    
    send_data report_data, :type => server.getContentType('PDF'), :filename => "fabricadores.pdf", :disposition => 'inline'
     
  end
  
  def quitarcategoria
    id =params[:id]
    categoria_id =params[:categoria_id]
    categoria = Activo::FabricadorCategoriaCi.where("fabricador_ci_id=#{id} and categoria_ci_id = #{categoria_id}")[0]
    @activo_fabricador_ci = Activo::FabricadorCi.find(id)
     respond_to do |format|
      if categoria.destroy
        format.html { redirect_to edit_activo_fabricador_ci_path(@activo_fabricador_ci), notice: 'Eliminado Correctamente.' }
      else
        format.html { render action: "edit" }        
      end
    end
    end
  
  def agregarcategoria
    @id =params[:id]
    categoria = Activo::FabricadorCategoriaCi.select(:categoria_ci_id).where("fabricador_ci_id = #{@id}")
    ids = Array.new
    categoria.each do |i|
      ids.push(i.categoria_ci_id)   
    end
    if categoria.count > 0
      @activo_categoria_cis = Activo::CategoriaCi.where("id not in (#{ids.join(',').to_s})")
    else
      @activo_categoria_cis = Activo::CategoriaCi.all
    end
    render :layout => false
  end
  
  def seleccionarcategoria
    id =params[:id]
    categoria_id =params[:categoria_id]
    categoria = Activo::FabricadorCategoriaCi.new
    categoria.categoria_ci_id = categoria_id.to_i
    categoria.fabricador_ci_id = id.to_i
     @activo_fabricador_ci = Activo::FabricadorCi.find(id)
     respond_to do |format|
      if categoria.save
        format.html { redirect_to edit_activo_fabricador_ci_path(@activo_fabricador_ci), notice: 'Guardado Correctamente.' }
      else
        format.html { render action: "edit" }        
      end
    end

  end
  
  # GET /activo/fabricador_cis
  # GET /activo/fabricador_cis.json
  def index
    squery = ""
    
    if !params[:prBuscarId].nil? && !params[:prBuscarId].blank?
      squery = "id = #{params[:prBuscarId]}"   
    end
    
    if !params[:prBuscarNombre].nil? && !params[:prBuscarNombre].blank?
      if !squery.blank?
        squery = squery + " AND nombre_comercial LIKE '%#{params[:prBuscarNombre]}%'"  
      else
        squery = "nombre_comercial LIKE '%#{params[:prBuscarNombre]}%'"
      end
    end
    
    if !params[:prBuscarPagina].nil? && !params[:prBuscarPagina].blank?
      if !squery.blank?
        squery = squery + " AND pagina_web LIKE '%#{params[:prBuscarPagina]}%'"  
      else
        squery = "pagina_web LIKE '%#{params[:prBuscarPagina]}%'"
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
      @activo_fabricador_cis = Activo::FabricadorCi.where(squery).page(params[:page]).per(5)
      @pr_buscar_id = params[:prBuscarId]
      @pr_buscar_nombre = params[:prBuscarNombre]
      @pr_buscar_pagina = params[:prBuscarPagina]
      @pr_buscar_fecha_inicio_vig = params[:prBuscarFechaInicioVig]
      @pr_buscar_fecha_fin_vig = params[:prBuscarFechaFinVig]
    else
      @activo_fabricador_cis = Activo::FabricadorCi.page(params[:page]).per(5)
      @pr_buscar_id = ""
      @pr_buscar_nombre = ""
      @pr_buscar_pagina = ""
      @pr_buscar_fecha_inicio_vig = ""
      @pr_buscar_fecha_fin_vig = ""
    end 
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @activo_fabricador_cis }
    end
  end

  # GET /activo/fabricador_cis/new
  # GET /activo/fabricador_cis/new.json
  def new
    @activo_fabricador_ci = Activo::FabricadorCi.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @activo_fabricador_ci }
    end
  end

  # GET /activo/fabricador_cis/1/edit
  def edit
    @activo_fabricador_ci = Activo::FabricadorCi.find(params[:id])
    @activo_categoria_cis = Activo::CategoriaCi.joins(:fabricadores).where("activo_fabricador_categoria_cis.fabricador_ci_id=?",@activo_fabricador_ci.id)
  end
  
  def show
    @activo_fabricador_ci = Activo::FabricadorCi.find(params[:id])
    @activo_categoria_cis = Activo::CategoriaCi.joins(:fabricadores).where("activo_fabricador_categoria_cis.fabricador_ci_id=?",@activo_fabricador_ci.id)
  end

  # POST /activo/fabricador_cis
  # POST /activo/fabricador_cis.json
  def create
    @activo_fabricador_ci = Activo::FabricadorCi.new(params[:activo_fabricador_ci])

    respond_to do |format|
      if @activo_fabricador_ci.save
        format.html { redirect_to edit_activo_fabricador_ci_path(@activo_fabricador_ci), notice: 'Guardado Correctamente.' }
        format.json { render json: @activo_fabricador_ci, status: :created, location: @activo_fabricador_ci }
      else
        format.html { render action: "new" }
        format.json { render json: @activo_fabricador_ci.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /activo/fabricador_cis/1
  # PUT /activo/fabricador_cis/1.json
  def update
    @activo_fabricador_ci = Activo::FabricadorCi.find(params[:id])

    respond_to do |format|
      if @activo_fabricador_ci.update_attributes(params[:activo_fabricador_ci])
        format.html { redirect_to edit_activo_fabricador_ci_path(@activo_fabricador_ci), notice: 'Actualizado Correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @activo_fabricador_ci.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activo/fabricador_cis/1
  # DELETE /activo/fabricador_cis/1.json
  def destroy
    @activo_fabricador_ci = Activo::FabricadorCi.find(params[:id])
    
    categoria = Activo::FabricadorCategoriaCi.where("fabricador_ci_id=#{params[:id]}")
    
    categoria.each do  |i|
      i.destroy
    end
    
     if @activo_fabricador_ci.destroy
      flash[:notice] = 'Eliminado Correctamente'
    end

    respond_to do |format|
      format.html { redirect_to activo_fabricador_cis_url }
      format.json { head :no_content }
    end
  end
end
