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
class Incidente::TipoIncidenteCategoriaCi < ActiveRecord::Base
  
  attr_accessible :categoria_ci_id, :descripcion_corta, :descripcion_larga, :estado_id
  
  audit(:create,:update, :destroy)

  belongs_to :categoria, :class_name => 'Activo::CategoriaCi', :foreign_key => 'categoria_ci_id'
  belongs_to :estado, :class_name => 'Catalogo::Catalogo', :foreign_key => 'estado_id'
  
  
  validates_presence_of :categoria_ci_id, :descripcion_corta, :descripcion_larga, :estado_id, :message => "Campo Requerido"
  
  validates_format_of :descripcion_corta, :with => /^[a-zA-Z áéíóúAÉÍÓÚÑñ]*$/, :keypress=>true,:message => "No se aceptan números"
  validates_format_of :descripcion_larga, :with => /^[a-zA-Z áéíóúAÉÍÓÚÑñ]*$/, :keypress=>true,:message => "No se aceptan números"
  
  validates_length_of :descripcion_corta, :maximum => 200, :too_long => "Descripción muy larga"
  validates_length_of :descripcion_larga, :maximum => 500, :too_long => "Descripción muy larga"
  

end
