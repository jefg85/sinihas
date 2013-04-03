# encoding: utf-8
=begin

==SINIHAS                                                          
Copyright (C)  2013  SINIHAS
                                                                   
* Nombre archivo: -
* Descripción:                                                               
* Versión        1.0 
* Creado por:       
* Creado el:                                                                                                                          

=end

class Utils::Permiso

	def verificar_permiso(menu_id,rol_id)
		permiso = Seguridad::RolMenu.where('menu_id=? and rol_id=?'menu_id,rol_id)
		permiso.crear = permiso.crear.nil? ? false : permiso.crear
		permiso.actualizar = permiso.crear.nil? ? false : permiso.crear
		permiso.borrar = permiso.crear.nil? ? false : permiso.crear
		permiso.ver = permiso.crear.nil? ? false : permiso.crear
		permiso 	
	end
	
end