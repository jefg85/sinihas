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

class Peticion::PeticionServicioTi < ActiveRecord::Base
  attr_accessible :estado_id, :fecha_asignacion, :soporte_ci_id,:peticion_id,:servicio_id
  
  audit(:create,:update, :destroy)
  
end
