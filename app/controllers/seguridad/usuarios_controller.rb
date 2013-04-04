# encoding: utf-8
class Seguridad::UsuariosController < ApplicationController
  

def agregarrol


    @usuario_id =params[:usuario_id]
    roles_usuarios = Seguridad::Permiso.select(:role_id).where("usuario_id = #{ params[:usuario_id]}")
    
    ids = Array.new
        
    roles_usuarios.each do |i|
      ids.push(i.role_id)   
    end
        
    if roles_usuarios.count > 0
      @seguridad_roles = Seguridad::Role.where(" id not in (#{ids.join(',').to_s})").order("nombre")
    else
      @seguridad_roles = Seguridad::Role.where("activo = 1").order("nombre")
    end

    render :layout => 'popup'

  end

  def seleccionarrol
    rol_id =params[:rol_id]
    usuario_id =params[:usuario_id]

    permiso = Seguridad::Permiso.new
    permiso.role_id = rol_id.to_i
    permiso.usuario_id = usuario_id.to_i

     @seguridad_usuario = Seguridad::Usuario.find(usuario_id)

     respond_to do |format|
      if permiso.save
        format.html { redirect_to edit_seguridad_usuario_path(@seguridad_usuario), notice: 'Guardado Correctamente.' }        
      else
        format.html { render action: "edit" }        
      end
    end

  end


   def quitarrol
    rol_id =params[:rol_id]
    usuario_id =params[:usuario_id]

    permiso = Seguridad::Permiso.where("role_id=#{rol_id} and usuario_id = #{usuario_id}")[0]
    
    @seguridad_usuario = Seguridad::Usuario.find(usuario_id)

     respond_to do |format|
      if permiso.destroy
        format.html { redirect_to edit_seguridad_usuario_path(@seguridad_usuario), notice: 'Eliminado Correctamente.' }        
      else
        format.html { render action: "edit" }        
      end
    end
    
  end

  # GET /seguridad/usuarios
  # GET /seguridad/usuarios.json
  def index
    @seguridad_usuarios = Seguridad::Usuario.order('usuario')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @seguridad_usuarios }
    end
  end

  # GET /seguridad/usuarios/new
  # GET /seguridad/usuarios/new.json
  def new
    @seguridad_usuario = Seguridad::Usuario.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @seguridad_usuario }
    end
  end

  # GET /seguridad/usuarios/1/edit
  def edit
    @seguridad_usuario = Seguridad::Usuario.find(params[:id])



    @usuario_id =params[:id]
    roles_usuarios = Seguridad::Permiso.select(:role_id).where("usuario_id = #{ params[:id]}")
    
    ids = Array.new
        
    roles_usuarios.each do |i|
      ids.push(i.role_id)   
    end
        
    if roles_usuarios.count > 0
      @seguridad_roles = Seguridad::Role.where(" id in (#{ids.join(',').to_s})").order("nombre")
    else
      @seguridad_roles = Array.new
    end


  end

  # POST /seguridad/usuarios
  # POST /seguridad/usuarios.json
  def create
    @seguridad_usuario = Seguridad::Usuario.new(params[:seguridad_usuario])

    respond_to do |format|
      if @seguridad_usuario.save
        format.html { redirect_to edit_seguridad_usuario_path(@seguridad_usuario), notice: 'Guardado Correctamente.' }
        format.json { render json: @seguridad_usuario, status: :created, location: @seguridad_usuario }
      else
        format.html { render action: "new" }
        format.json { render json: @seguridad_usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /seguridad/usuarios/1
  # PUT /seguridad/usuarios/1.json
  def update
    @seguridad_usuario = Seguridad::Usuario.find(params[:id])

    if params[:seguridad_usuario][:password].blank?
      [:password,:password_confirmation,:current_password].collect{|p| params[:seguridad_usuario].delete(p) }    
    end

    respond_to do |format|
      if @seguridad_usuario.update_attributes(params[:seguridad_usuario])
        format.html { redirect_to edit_seguridad_usuario_path(@seguridad_usuario), notice: 'Guardado Correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @seguridad_usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /seguridad/usuarios/1
  # DELETE /seguridad/usuarios/1.json
  def destroy
    @seguridad_usuario = Seguridad::Usuario.find(params[:id])
    if @seguridad_usuario.destroy
      flash[:notice] = 'Eliminado Correctamente'
    end

    respond_to do |format|
      format.html { redirect_to seguridad_usuarios_url }
      format.json { head :no_content }
    end
  end
end
