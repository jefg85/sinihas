# encoding: utf-8
class Seguridad::RolMenusController < ApplicationController
  # GET /seguridad/rol_menus
  # GET /seguridad/rol_menus.json
  def index
    @seguridad_rol_menus = Seguridad::RolMenu.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @seguridad_rol_menus }
    end
  end

  # GET /seguridad/rol_menus/1
  # GET /seguridad/rol_menus/1.json
  def show
    @seguridad_rol_menu = Seguridad::RolMenu.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @seguridad_rol_menu }
    end
  end

  # GET /seguridad/rol_menus/new
  # GET /seguridad/rol_menus/new.json
  def new
    @seguridad_rol_menu = Seguridad::RolMenu.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @seguridad_rol_menu }
    end
  end

  # GET /seguridad/rol_menus/1/edit
  def edit
    @seguridad_rol_menu = Seguridad::RolMenu.find(params[:id])
  end

  # POST /seguridad/rol_menus
  # POST /seguridad/rol_menus.json
  def create
    rol_menu = Seguridad::RolMenu.new(params[:seguridad_rol_menu])
    @seguridad_role = Seguridad::Role.find(rol_menu.rol_id)

     respond_to do |format|
      if rol_menu.save
        format.html { redirect_to edit_seguridad_role_path(@seguridad_role), notice: 'Guardado Correctamente.' }        
      else
        format.html { redirect_to edit_seguridad_role_path(@seguridad_role), notice: 'Guardado Correctamente.' }        
      end
    end

  end

  # PUT /seguridad/rol_menus/1
  # PUT /seguridad/rol_menus/1.json
  def update
    @seguridad_rol_menu = Seguridad::RolMenu.find(params[:id])

    respond_to do |format|
      if @seguridad_rol_menu.update_attributes(params[:seguridad_rol_menu])
        format.html { redirect_to @seguridad_rol_menu, notice: 'Rol menu was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @seguridad_rol_menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /seguridad/rol_menus/1
  # DELETE /seguridad/rol_menus/1.json
  def destroy
    @seguridad_rol_menu = Seguridad::RolMenu.find(params[:id])
    @seguridad_rol_menu.destroy

    respond_to do |format|
      format.html { redirect_to seguridad_rol_menus_url }
      format.json { head :no_content }
    end
  end
end
