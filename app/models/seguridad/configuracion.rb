class Seguridad::Configuracion < ActiveRecord::Base
  set_table_name 'seguridad_configuracion'
  attr_accessible :codigo, :nombre, :valor
end
