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
class Seguridad::Menu < ActiveRecord::Base
  attr_accessible :menu_id, :modulo_id, :nombre, :orden,:tipo,:codigo

  belongs_to :modulo, :class_name => 'Seguridad::Modulo', :foreign_key => 'modulo_id'

  audit(:create,:update, :destroy)
end
