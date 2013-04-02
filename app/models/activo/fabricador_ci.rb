# encoding: utf-8
class Activo::FabricadorCi < ActiveRecord::Base
  attr_accessible :id, :fecha_fin_vigencia, :fecha_inicio_vigencia, :nombre_comercial, :pagina_web, :url_logo
  
  audit(:create,:update, :destroy)
  
  
  validates_presence_of :nombre_comercial,:fecha_fin_vigencia,:fecha_inicio_vigencia, :message => "Campo Requerido"
  
  validates_format_of :nombre_comercial, :with => /^[a-zA-Z áéíóúAÉÍÓÚÑñ]*$/, :keypress=>true,:message => "No se aceptan números"
  
  validates_length_of :nombre_comercial, :maximum => 500, :too_long => "Nombre muy largo", :blank=>true
  
  
end
