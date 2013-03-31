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
class Activo::RelacionCi < ActiveRecord::Base
  attr_accessible :ci_id, :ci_relacion_id, :estado_id, :fecha, :relacion_id
  
  audit(:create,:update, :destroy)
  
  belongs_to :ci_padre, :class_name => 'Activo::Ci', :foreign_key => 'ci_id'
  belongs_to :ci_hijo, :class_name => 'Activo::Ci', :foreign_key => 'ci_relacion_id'
  
  
  validates_presence_of :estado_id,:fecha, :message => "Campo Requerido"
  
  
end
