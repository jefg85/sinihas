# encoding: utf-8
class Activo::FabricadorCategoriaCi < ActiveRecord::Base
  attr_accessible :categoria_ci_id, :estado_id, :fabricador_ci_id
  audit(:create,:update, :destroy)
end
