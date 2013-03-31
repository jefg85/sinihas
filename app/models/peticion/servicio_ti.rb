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

class Peticion::ServicioTi < ActiveRecord::Base
  
  attr_accessible :categoria_servicio_id, :ci_id, :costo_asociado, 
  :descripcion_servicio,  :estado_id, :imagen, :nombre_servicio, :servicio_padre_id

  audit(:create,:update, :destroy)

  belongs_to :categoria, :class_name => 'Catalogo::Catalogo', :foreign_key => 'categoria_servicio_id'
  belongs_to :estado, :class_name => 'Catalogo::Catalogo', :foreign_key => 'estado_id'
  
  has_many :peticiones, :class_name => 'Peticion::PeticionServicioTi', :foreign_key => 'servicio_id'
  
  validates_presence_of :categoria_servicio_id,:ci_id,:costo_asociado,:nombre_servicio, :message => "Campo Requerido"
  
  validates_format_of :nombre_servicio, :with => /^[a-zA-Z áéíóúAÉÍÓÚÑñ]*$/, :keypress=>true,:message => "No se aceptan números"
  validates_format_of :descripcion_servicio, :with => /^[a-zA-Z áéíóúAÉÍÓÚÑñ]*$/, :keypress=>true,:message => "No se aceptan números", :blank=>true
  
  validates_length_of :nombre_servicio, :maximum => 200, :too_long => "Nombre muy largo"
  validates_length_of :descripcion_servicio, :maximum => 500, :too_long => "Descripción muy larga", :blank=>true
  
  


end
