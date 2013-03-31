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
class Seguridad::Modulo < ActiveRecord::Base
  attr_accessible :bloqueado, :nombre, :url_imagen, :url_inicio,:orden

  audit(:create,:update, :destroy)
end
