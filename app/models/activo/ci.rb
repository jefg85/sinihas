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

class Activo::Ci < ActiveRecord::Base
  attr_accessible :categoria_nivel_i_id, :categoria_nivel_ii_id, :categoria_nivel_iii, 
  :codigo_inventario, :departamento_oficina_id, :descripcion, :direccion_division_id, 
  :edificio_id, :fabricador_id, :impacto_id, :informacion_adicional, :modelo_version, 
  :nombre, :nombre_producto, :numero_parte, :numero_serial, :prioridad_id, :proveedor_id, 
  :seccion_unidad_id, :soporte, :urgencia_id, :usuarios_afectados
  
  audit(:create,:update, :destroy)
  
  belongs_to :proveedor, :class_name => 'Activo::ProveedorCi', :foreign_key => 'proveedor_id'
  belongs_to :fabricador, :class_name => 'Activo::FabricadorCi', :foreign_key => 'fabricador_id'
  
  has_many :ciclo_vida, :class_name => 'Activo::CicloVida', :foreign_key => 'ci_id'
  has_many :relaciones, :class_name => 'Activo::RelacionCi', :foreign_key => 'ci_id'
  has_many :especificaciones, :class_name => 'Activo::EspecificacionCi', :foreign_key => 'ci_id'
  has_many :datos_trabajo, :class_name => 'Activo::DatoTrabajoCi', :foreign_key => 'ci_id'
  
  validates_presence_of :codigo_inventario,:fabricador_id,:nombre,:nombre_producto,:numero_parte, :message => "Campo Requerido"
  
  validates_format_of :nombre, :with => /^[a-zA-Z áéíóúAÉÍÓÚÑñ]*$/, :keypress=>true,:message => "No se aceptan números"
  validates_format_of :nombre_producto, :with => /^[a-zA-Z áéíóúAÉÍÓÚÑñ]*$/, :keypress=>true,:message => "No se aceptan números"
  
  validates_format_of :numero_parte, :with => /^[0-9]{1,3}$/, :keypress=>true, :message => "No se aceptan letras o numeros negativos"
  validates_format_of :numero_serial, :with => /^[0-9]{1,3}$/, :keypress=>true, :message => "No se aceptan letras o numeros negativos", :blank=>true
  
  validates_length_of :nombre, :maximum => 200, :too_long => "Nombre muy largo"
  validates_length_of :nombre_producto, :maximum => 500, :too_long => "Nombre muy largo", :blank=>true
  
  
end
