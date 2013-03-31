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

class Seguridad::Role < ActiveRecord::Base
  
  attr_accessible :activo, :nombre
  
  audit(:create,:update, :destroy)
  
  validates_presence_of :nombre, :message => "Campo Requerido"
  
  validates_format_of :nombre, :with => /^[a-zA-Z áéíóúAÉÍÓÚÑñ]*$/, :keypress=>true,:message => "No se aceptan números"
  
  validates_length_of :nombre, :maximum => 200, :too_long => "Nombre muy largo"
  
  
end
