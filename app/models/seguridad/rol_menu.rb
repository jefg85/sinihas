# encoding: utf-8
=begin

==SINIHAS                                                          
Copyright (C)  2012  SINIHAS
                                                                   
* Nombre archivo: -
* Descripción:                                                               
* Versión        1.0 
* Creado por:       
* Creado el:                                                                                                                          

=end
class Seguridad::RolMenu < ActiveRecord::Base
  attr_accessible :menu_id, :rol_id,:crear,:actualizar,:ver,:borrar
  audit(:create,:update, :destroy)

  belongs_to :menus, :class_name => 'Seguridad::Menu', :foreign_key => 'menu_id'

end
