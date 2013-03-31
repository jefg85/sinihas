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

class Catalogo::Catalogo < ActiveRecord::Base
  attr_accessible :activo, :descripcion, :nombre, :orden, :tipo_catalogo_id

  audit(:create,:update, :destroy)
  
  
  validates_presence_of :nombre,:orden, :message => "Campo Requerido"
  
  validates_format_of :nombre, :with => /^[a-zA-Z áéíóúAÉÍÓÚÑñ]*$/, :keypress=>true,:message => "No se aceptan números"
  
  validates_format_of :orden, :with => /^[0-9]{1,3}$/, :keypress=>true, :message => "No se aceptan letras o numeros negativos"
  
  validates_length_of :nombre, :maximum => 200, :too_long => "Nombre muy larga"
  validates_length_of :descripcion, :maximum => 500, :too_long => "Descripción muy larga", :blank=>true
  
  
end
