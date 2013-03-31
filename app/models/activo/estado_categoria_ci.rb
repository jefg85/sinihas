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

class Activo::EstadoCategoriaCi < ActiveRecord::Base
  attr_accessible :categoria_ci_id, :estado_ci_id, :estado_id
  audit(:create,:update, :destroy)
  
  belongs_to :estado, :class_name => 'Activo::EstadoCi', :foreign_key => 'estado_ci_id'
end
