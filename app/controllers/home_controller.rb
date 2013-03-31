class HomeController < ApplicationController
  
  
  def index  
    session[:modulo_id] =nil
    session[:menus] = nil
    session[:modulo_nombre]=nil
    
    conn = ActiveRecord::Base.connection
    @modulos = conn.select_all "select distinct m.id, m.nombre,m.url_imagen,m.orden from seguridad_modulos m 
        inner join seguridad_menus me
        on m.id = me.modulo_id 
        inner join seguridad_rol_menus rm 
        on rm.menu_id = me.id
        inner join seguridad_permisos p on rm.rol_id = p.role_id and p.usuario_id=#{current_usuario.id.to_s}
        order by m.orden    
        "
    
  end
    
  def menu
    modulo_id = params[:modulo_id]
    session[:modulo_id] = modulo_id

    session[:modulo_nombre] = nombreModulo = Seguridad::Modulo.find(modulo_id.to_i).nombre

    conn = ActiveRecord::Base.connection
    menus = conn.select_all "select m.* from seguridad_menus m 
        inner join seguridad_rol_menus rm
        on m.id = rm.menu_id
        inner join seguridad_permisos p
        on p.role_id = rm.rol_id
        where m.modulo_id = #{modulo_id}
        and p.usuario_id= #{current_usuario.id.to_s}
        order by m.orden"

        session[:menus] = menus     

  end

   
end
