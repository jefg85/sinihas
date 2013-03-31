# encoding: utf-8
class Seguridad::RolesController < ApplicationController
  # GET /seguridad/roles
  # GET /seguridad/roles.json
  def index
    @seguridad_roles = Seguridad::Role.page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @seguridad_roles }
    end
  end

  # GET /seguridad/roles/new
  # GET /seguridad/roles/new.json
  def new
    @seguridad_role = Seguridad::Role.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @seguridad_role }
    end
  end

  # GET /seguridad/roles/1/edit
  def edit
    @seguridad_role = Seguridad::Role.find(params[:id])
    @seguridad_menus = Seguridad::RolMenu.select("seguridad_rol_menus.crear,seguridad_rol_menus.actualizar,seguridad_rol_menus.ver,seguridad_rol_menus.borrar,seguridad_menus.id,seguridad_menus.nombre,seguridad_menus.orden,seguridad_modulos.nombre as nombremodulo").joins(:menus=> :modulo).where("rol_id = ?",@seguridad_role.id).order("seguridad_modulos.nombre,seguridad_menus.orden")
  end


  def agregarmenu

    @seguridad_rol_menu = Seguridad::RolMenu.new
    @seguridad_rol_menu.rol_id = params[:rol_id]
    @rol_id =params[:rol_id]
    roles_menus = Seguridad::RolMenu.select(:menu_id).where("rol_id = #{ params[:rol_id]}")
    
    ids = Array.new
        
    roles_menus.each do |i|
      ids.push(i.menu_id)   
    end
        
    if roles_menus.count > 0
      @seguridad_menus = Seguridad::Menu.select("seguridad_menus.id,seguridad_menus.nombre,seguridad_menus.orden,seguridad_modulos.nombre as nombremodulo").joins(:modulo).where(" seguridad_menus.tipo = 'P' and seguridad_menus.id not in (#{ids.join(',').to_s})").order("seguridad_modulos.nombre,seguridad_menus.orden")
    else
      @seguridad_menus = Seguridad::Menu.select("seguridad_menus.id,seguridad_menus.nombre,seguridad_menus.orden,seguridad_modulos.nombre as nombremodulo").joins(:modulo).where("seguridad_menus.tipo = 'P'").order("seguridad_modulos.nombre,seguridad_menus.orden")
    end

    render :layout => 'popup'

  end



  def seleccionarmenu
    rol_id =params[:rol_id]
    menu_id =params[:menu_id]

    rol_menu = Seguridad::RolMenu.new
    rol_menu.rol_id = rol_id.to_i
    rol_menu.menu_id = menu_id.to_i

     @seguridad_role = Seguridad::Role.find(rol_id)

     respond_to do |format|
      if rol_menu.save
        format.html { redirect_to edit_seguridad_role_path(@seguridad_role), notice: 'Guardado Correctamente.' }        
      else
        format.html { render action: "edit" }        
      end
    end

  end


   def quitarmenu
    rol_id =params[:rol_id]
    menu_id =params[:menu_id]

    rol_menu = Seguridad::RolMenu.where("rol_id=#{rol_id} and menu_id = #{menu_id}")[0]
    
    @seguridad_role = Seguridad::Role.find(rol_id)

     respond_to do |format|
      if rol_menu.destroy
        format.html { redirect_to edit_seguridad_role_path(@seguridad_role), notice: 'Eliminado Correctamente.' }        
      else
        format.html { render action: "edit" }        
      end
    end
    
  end

  # POST /seguridad/roles
  # POST /seguridad/roles.json
  def create
    @seguridad_role = Seguridad::Role.new(params[:seguridad_role])

    respond_to do |format|
      if @seguridad_role.save
        format.html { redirect_to edit_seguridad_role_path(@seguridad_role) , notice: 'Guardado Correctamente.' }
        format.json { render json: @seguridad_role, status: :created, location: @seguridad_role }
      else
        format.html { render action: "new" }
        format.json { render json: @seguridad_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /seguridad/roles/1
  # PUT /seguridad/roles/1.json
  def update
    @seguridad_role = Seguridad::Role.find(params[:id])

    respond_to do |format|
      if @seguridad_role.update_attributes(params[:seguridad_role])
        format.html { redirect_to edit_seguridad_role_path(@seguridad_role), notice: 'Guardado Correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @seguridad_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /seguridad/roles/1
  # DELETE /seguridad/roles/1.json
  def destroy
    @seguridad_role = Seguridad::Role.find(params[:id])
    if @seguridad_role.destroy
      flash[:notice] = 'Eliminado Correctamente'
    end

    respond_to do |format|
      format.html { redirect_to seguridad_roles_url }
      format.json { head :no_content }
    end
  end
end
