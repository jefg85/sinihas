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
class Incidente::ActividadIncidente < ActiveRecord::Base
  attr_accessible :ci_utilizado_id, :descripcion, :estado_id, :fecha_fin, :fecha_inicio, 
  :incidente_id, :resolucion, :resumen, :soporte_ti_id
  
  audit(:create,:update, :destroy)
  
  
  validates_presence_of :ci_utilizado_id,:descripcion,:fecha_inicio,:fecha_fin,:resumen, :message => "Campo Requerido"
  
  validates_format_of :resumen, :with => /^[a-zA-Z áéíóúAÉÍÓÚÑñ]*$/, :keypress=>true,:message => "No se aceptan números"
  validates_format_of :descripcion, :with => /^[a-zA-Z áéíóúAÉÍÓÚÑñ]*$/, :keypress=>true,:message => "No se aceptan números"
  
  validates_length_of :resumen, :maximum => 200, :too_long => "Resumen muy largo"
  validates_length_of :descripcion, :maximum => 500, :too_long => "Descripción muy larga", :blank=>true
  
  
end
