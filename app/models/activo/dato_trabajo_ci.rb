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

class Activo::DatoTrabajoCi < ActiveRecord::Base
  
  attr_accessible :documento_adjunto, :fecha, :fuente_id, :resumen, :tipo_informacion_trabajo_id,
  :ci_id
  
  audit(:create,:update, :destroy)
  
  belongs_to :tipo, :class_name => 'Catalogo::Catalogo', :foreign_key => 'tipo_informacion_trabajo_id'
  belongs_to :fuente, :class_name => 'Catalogo::Catalogo', :foreign_key => 'fuente_id'
  
  
  validates_presence_of :fecha,:resumen,:fuente_id,:tipo_informacion_trabajo_id, :message => "Campo Requerido"
  
  validates_format_of :resumen, :with => /^[a-zA-Z áéíóúAÉÍÓÚÑñ]*$/, :keypress=>true,:message => "No se aceptan números"
  
  validates_length_of :resumen, :maximum => 500, :too_long => "Resumen muy largo"
  
  
end
