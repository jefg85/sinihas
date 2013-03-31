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

class Catalogo::TipoCatalogo < ActiveRecord::Base
  attr_accessible :activo, :codigo, :descripcion, :nombre
  
  audit(:create,:update, :destroy)
  
  validates_presence_of :codigo,:nombre, :message => "Campo Requerido"
  
  validates_format_of :nombre, :with => /^[a-zA-Z áéíóúAÉÍÓÚÑñ]*$/, :keypress=>true,:message => "No se aceptan números"
  
  validates_format_of :codigo, :with => /^[0-9]{1,3}$/, :keypress=>true, :message => "No se aceptan letras o numeros negativos"
  
  validates_length_of :nombre, :maximum => 200, :too_long => "Nombre muy largo"
  
  
end
