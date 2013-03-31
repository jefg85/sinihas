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
class Incidente::Incidente < ActiveRecord::Base
  
  attr_accessible :ci_id, :departamento_oficina, :descripcion, :direccion_division, :estado_id, 
  :fecha_incidente, :fecha_informe, :fecha_registro, :grupo_id, :impacto_id, :informado_por, 
  :modo_id, :prioridad_id, :resolucion, :resumen, :seccion_unidad, :tipo_incidente_id
  
  audit(:create,:update, :destroy)

  belongs_to :estado, :class_name => 'Catalogo::Catalogo', :foreign_key => 'estado_id'
  belongs_to :grupo, :class_name => 'Catalogo::Catalogo', :foreign_key => 'grupo_id'
  belongs_to :prioridad, :class_name => 'Catalogo::Catalogo', :foreign_key => 'prioridad_id'
  belongs_to :impacto, :class_name => 'Catalogo::Catalogo', :foreign_key => 'impacto_id'
  belongs_to :tipo, :class_name => 'Incidente::TipoIncidenteCategoriaCi', :foreign_key => 'tipo_incidente_id'
  
  
  validates_presence_of :fecha_incidente,:fecha_informe,:resumen, :message => "Campo Requerido"
  
  validates_format_of :resumen, :with => /^[a-zA-Z áéíóúAÉÍÓÚÑñ]*$/, :keypress=>true,:message => "No se aceptan números"
  validates_format_of :resolucion, :with => /^[a-zA-Z áéíóúAÉÍÓÚÑñ]*$/, :keypress=>true,:message => "No se aceptan números",:allow_blank=>true
  
  validates_length_of :resumen, :maximum => 200, :too_long => "Texto muy largo"
  validates_length_of :resolucion, :maximum => 500, :too_long => "Texto muy largo", :allow_blank=>true
  
  

end
