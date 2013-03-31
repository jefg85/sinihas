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
class Activo::PropiedadEspecificaCi < ActiveRecord::Base
  
  attr_accessible :fecha_fin_vigencia, :fecha_inicio_vigencia, :nombre_campo, 
  :tipo_campo, :valor_string, :visualizar
  
  audit(:create,:update, :destroy)
  
  belongs_to :tipo, :class_name => 'Catalogo::Catalogo', :foreign_key => 'tipo_campo'
  
  validates_presence_of :nombre_campo,:valor_string,:fecha_fin_vigencia,:fecha_inicio_vigencia,:tipo_campo, :message => "Campo Requerido"
  
  validates_format_of :nombre_campo, :with => /^[a-zA-Z áéíóúAÉÍÓÚÑñ]*$/, :keypress=>true,:message => "No se aceptan números"
  
  validates_length_of :nombre_campo, :maximum => 100, :too_long => "Nombre muy largo"
  
  
end
