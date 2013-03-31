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

class Peticion::PeticionTi < ActiveRecord::Base
  attr_accessible :departamento_oficina_id, :descripcion, :direccion_division_id, 
  :estado_id, :motivo_cancelacion, :nombre_peticion_ti, :prioridad_id, :seccion_unidad_id, 
  :tipo_peticion_id, :usuario_ti_id
  
  audit(:create,:update, :destroy)

  belongs_to :tipo, :class_name => 'Catalogo::Catalogo', :foreign_key => 'tipo_peticion_id'
  belongs_to :prioridad, :class_name => 'Catalogo::Catalogo', :foreign_key => 'prioridad_id'
  belongs_to :estado, :class_name => 'Catalogo::Catalogo', :foreign_key => 'estado_id'
  
  validates_presence_of :descripcion,:nombre_peticion_ti,:prioridad_id,:estado_id,:tipo_peticion_id, :message => "Campo Requerido"
  
  validates_format_of :nombre_peticion_ti, :with => /^[a-zA-Z áéíóúAÉÍÓÚÑñ]*$/, :keypress=>true,:message => "No se aceptan números"
  validates_format_of :descripcion, :with => /^[a-zA-Z áéíóúAÉÍÓÚÑñ]*$/, :keypress=>true,:message => "No se aceptan números"
  
  validates_length_of :nombre_peticion_ti, :maximum => 200, :too_long => "Nombre muy largo"
  validates_length_of :descripcion, :maximum => 500, :too_long => "Descripción muy larga"
  
  
end
