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
class Activo::CategoriaCi < ActiveRecord::Base
  attr_accessible :descripcion_corta, :descripcion_larga, :fecha_fin_vigencia, 
  :fecha_inicio_vigencia, :nivel_i_id, :nivel_ii_id, :posicion, 
  :prefijo_nombramiento, :imagen,:tipo
  
  audit(:create,:update, :destroy)
  
  has_many :estados, :class_name => 'Activo::EstadoCategoriaCi', :foreign_key => 'categoria_ci_id'
  has_many :propiedades, :class_name => 'Activo::PropiedadEspecificaCategoriaCi', :foreign_key => 'categoria_ci_id'
  has_many :fabricadores, :class_name => 'Activo::FabricadorCategoriaCi', :foreign_key => 'categoria_ci_id'
  has_many :categorias, :class_name => 'Activo::CategoriaCi', :foreign_key => 'nivel_i_id'
  
  
  validates_presence_of :tipo,:descripcion_corta,:fecha_fin_vigencia,:fecha_inicio_vigencia,:posicion, :message => "Campo Requerido"
  
  validates_format_of :descripcion_corta, :with => /^[a-zA-Z áéíóúAÉÍÓÚÑñ]*$/, :keypress=>true,:message => "No se aceptan números"
  validates_format_of :descripcion_larga, :with => /^[a-zA-Z áéíóúAÉÍÓÚÑñ]*$/, :keypress=>true,:message => "No se aceptan números"
  
  validates_format_of :posicion, :with => /^[0-9]{1,3}$/, :keypress=>true, :message => "No se aceptan letras o numeros negativos"
  
  validates_length_of :descripcion_corta, :maximum => 200, :too_long => "Descripción muy larga"
  validates_length_of :descripcion_larga, :maximum => 500, :too_long => "Descripción muy larga", :allow_blank=>true
  
  
end
