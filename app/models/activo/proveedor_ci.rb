# encoding: utf-8
class Activo::ProveedorCi < ActiveRecord::Base
  attr_accessible :direccion, :fecha_fin_vigencia, :fecha_inicio_vigencia, :nit, 
  :nombre_comercial, :pagina_web, :sigla, :telefono_celular, :telefono_convencional, 
  :telefono_fax, :tipo_proveedor_id, :url_logo
  
  audit(:create,:update, :destroy)
  
  belongs_to :tipo, :class_name => 'Catalogo::Catalogo', :foreign_key => 'tipo_proveedor_id'
  
  
  validates_presence_of :nombre_comercial,:fecha_fin_vigencia,:fecha_inicio_vigencia,:tipo_proveedor_id ,:message => "Campo Requerido"
  
  validates_format_of :nombre_comercial, :with => /^[a-zA-Z áéíóúAÉÍÓÚÑñ]*$/, :keypress=>true,:message => "No se aceptan números"
  validates_format_of :direccion, :with => /^[a-zA-Z áéíóúAÉÍÓÚÑñ]*$/, :keypress=>true,:message => "No se aceptan números"
  
  validates_length_of :nombre_comercial, :maximum => 200, :too_long => "Nombre muy largo"
  validates_length_of :direccion, :maximum => 500, :too_long => "Dirección muy larga", :blank=>true
  
  
end
