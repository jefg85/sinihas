# encoding: utf-8
class Seguridad::MenusController < ApplicationController
  # GET /seguridad/menus
  # GET /seguridad/menus.json
  def index
    @seguridad_menus = Seguridad::Menu.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @seguridad_menus }
    end
  end

  # GET /seguridad/menus/1
  # GET /seguridad/menus/1.json
  def show
    @seguridad_menu = Seguridad::Menu.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @seguridad_menu }
    end
  end

  # GET /seguridad/menus/new
  # GET /seguridad/menus/new.json
  def new
    @seguridad_menu = Seguridad::Menu.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @seguridad_menu }
    end
  end

  # GET /seguridad/menus/1/edit
  def edit
    @seguridad_menu = Seguridad::Menu.find(params[:id])
  end

  # POST /seguridad/menus
  # POST /seguridad/menus.json
  def create
    @seguridad_menu = Seguridad::Menu.new(params[:seguridad_menu])

    respond_to do |format|
      if @seguridad_menu.save
        format.html { redirect_to @seguridad_menu, notice: 'Menu was successfully created.' }
        format.json { render json: @seguridad_menu, status: :created, location: @seguridad_menu }
      else
        format.html { render action: "new" }
        format.json { render json: @seguridad_menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /seguridad/menus/1
  # PUT /seguridad/menus/1.json
  def update
    @seguridad_menu = Seguridad::Menu.find(params[:id])

    respond_to do |format|
      if @seguridad_menu.update_attributes(params[:seguridad_menu])
        format.html { redirect_to @seguridad_menu, notice: 'Menu was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @seguridad_menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /seguridad/menus/1
  # DELETE /seguridad/menus/1.json
  def destroy
    @seguridad_menu = Seguridad::Menu.find(params[:id])
    @seguridad_menu.destroy

    respond_to do |format|
      format.html { redirect_to seguridad_menus_url }
      format.json { head :no_content }
    end
  end
end
