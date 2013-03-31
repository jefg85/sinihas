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

class Activo::CicloVida < ActiveRecord::Base
  
  attr_accessible :ci_id, :estado_categoria_ci_id, :estado_id, :fecha, :observaciones, :operacion, 
  :orden, :responsable_id
  
  audit(:create,:update, :destroy)
  
  belongs_to :estado_categoria, :class_name => 'Activo::EstadoCategoriaCi', :foreign_key => 'estado_categoria_ci_id'
  
  
  validates_presence_of :ci_id,:estado_categoria_ci_id,:fecha,:operacion,:orden, :message => "Campo Requerido"
  
  validates_format_of :operacion, :with => /^[a-zA-Z áéíóúAÉÍÓÚÑñ]*$/, :keypress=>true,:message => "No se aceptan números"
  
  validates_format_of :orden, :with => /^[0-9]{1,3}$/, :keypress=>true, :message => "No se aceptan letras o numeros negativos"
  
  validates_length_of :operacion, :maximum => 200, :too_long => "Operación muy larga"
  
  
end
