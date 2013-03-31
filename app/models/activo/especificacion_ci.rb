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

class Activo::EspecificacionCi < ActiveRecord::Base
  attr_accessible :ci_id, :estado_id, :prop_esp_ci_id, :valor_binario, :valor_cadena, :valor_logico, :valor_numerico, :valor_real
  
  audit(:create,:update, :destroy)
  
  belongs_to :propiedad, :class_name => 'Activo::PropiedadEspecificaCi', :foreign_key => 'prop_esp_ci_id'
  
  validates_presence_of :ci_id,:prop_esp_ci_id, :message => "Campo Requerido"
  
end
