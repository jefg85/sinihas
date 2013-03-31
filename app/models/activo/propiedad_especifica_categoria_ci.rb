# encoding: utf-8
class Activo::PropiedadEspecificaCategoriaCi < ActiveRecord::Base
  attr_accessible :categoria_ci_id, :estado_id, :prop_espc_ci
  audit(:create,:update, :destroy)
end
