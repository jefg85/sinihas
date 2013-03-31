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

class Activo::EstadoCi < ActiveRecord::Base
  attr_accessible :color, :descripcion, :fecha_fin_vigencia, :fecha_inicio_vigencia, :nombre
  
  audit(:create,:update, :destroy)
  
  
  validates_presence_of :color,:descripcion,:fecha_fin_vigencia,:fecha_inicio_vigencia,:nombre, :message => "Campo Requerido"
  
  validates_format_of :nombre, :with => /^[a-zA-Z áéíóúAÉÍÓÚÑñ]*$/, :keypress=>true,:message => "No se aceptan números"
  
  validates_length_of :nombre, :maximum => 200, :too_long => "Nombre muy larga"
  
  
end
