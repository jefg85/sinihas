# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121008183932) do

  create_table "activo_categoria_cis", :force => true do |t|
    t.string   "descripcion_corta"
    t.string   "descripcion_larga"
    t.string   "prefijo_nombramiento"
    t.integer  "nivel_i_id"
    t.integer  "nivel_ii_id"
    t.integer  "nivel_iii_id"
    t.string   "url_imagen"
    t.integer  "posicion"
    t.date     "fecha_inicio_vigencia"
    t.date     "fecha_fin_vigencia"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "activo_ciclo_vidas", :force => true do |t|
    t.integer  "ci_id"
    t.string   "operacion"
    t.integer  "estado_categoria_ci_id"
    t.integer  "responsable_id"
    t.date     "fecha"
    t.string   "observaciones"
    t.integer  "orden"
    t.integer  "estado_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "activo_cis", :force => true do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.string   "codigo_inventario"
    t.string   "numero_serial"
    t.integer  "numero_parte"
    t.boolean  "soporte"
    t.integer  "impacto_id"
    t.integer  "urgencia_id"
    t.integer  "prioridad_id"
    t.string   "usuarios_afectados"
    t.string   "informacion_adicional"
    t.integer  "categoria_nivel_i_id"
    t.integer  "categoria_nivel_ii_id"
    t.integer  "categoria_nivel_iii"
    t.string   "nombre_producto"
    t.string   "modelo_version"
    t.integer  "fabricador_id"
    t.integer  "proveedor_id"
    t.integer  "direccion_division_id"
    t.integer  "departamento_oficina_id"
    t.integer  "seccion_unidad_id"
    t.integer  "edificio_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "activo_dato_trabajo_cis", :force => true do |t|
    t.integer  "tipo_informacion_trabajo_id"
    t.date     "fecha"
    t.integer  "fuente_id"
    t.string   "resumen"
    t.string   "documento_adjunto"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "activo_especificacion_cis", :force => true do |t|
    t.integer  "ci_id"
    t.integer  "prop_esp_ci_id"
    t.string   "valor_cadena"
    t.string   "valor_logico"
    t.integer  "valor_numerico"
    t.decimal  "valor_real",     :precision => 18, :scale => 0
    t.string   "valor_binario"
    t.integer  "estado_id"
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
  end

  create_table "activo_estado_categoria_cis", :force => true do |t|
    t.integer  "categoria_ci_id"
    t.integer  "estado_ci_id"
    t.integer  "estado_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "activo_estado_cis", :force => true do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.string   "color"
    t.date     "fecha_inicio_vigencia"
    t.date     "fecha_fin_vigencia"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "activo_fabricador_categoria_cis", :force => true do |t|
    t.integer  "categoria_ci_id"
    t.integer  "fabricador_ci_id"
    t.integer  "estado_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "activo_fabricador_cis", :force => true do |t|
    t.string   "nombre_comercial"
    t.string   "pagina_web"
    t.string   "url_logo"
    t.date     "fecha_inicio_vigencia"
    t.date     "fecha_fin_vigencia"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "activo_propiedad_especifica_categoria_cis", :force => true do |t|
    t.integer  "categoria_ci_id"
    t.integer  "prop_espc_ci"
    t.integer  "estado_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "activo_propiedad_especifica_cis", :force => true do |t|
    t.string   "nombre_campo"
    t.integer  "tipo_campo"
    t.string   "valor_string"
    t.boolean  "visualizar"
    t.date     "fecha_inicio_vigencia"
    t.date     "fecha_fin_vigencia"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "activo_proveedor_cis", :force => true do |t|
    t.string   "nit"
    t.string   "nombre_comercial"
    t.string   "sigla"
    t.string   "tipo_proveedor_id"
    t.string   "direccion"
    t.string   "telefono_convencional"
    t.string   "telefono_celular"
    t.string   "telefono_fax"
    t.string   "pagina_web"
    t.string   "url_logo"
    t.date     "fecha_inicio_vigencia"
    t.date     "fecha_fin_vigencia"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "activo_relacion_cis", :force => true do |t|
    t.integer  "ci_id"
    t.integer  "relacion_id"
    t.integer  "ci_relacion_id"
    t.date     "fecha"
    t.integer  "estado_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "audits", :force => true do |t|
    t.integer  "auditable_id",                   :null => false
    t.string   "auditable_type",                 :null => false
    t.integer  "owner_id",                       :null => false
    t.string   "owner_type",                     :null => false
    t.integer  "user_id",                        :null => false
    t.string   "user_type",                      :null => false
    t.string   "action",                         :null => false
    t.text     "audited_changes"
    t.integer  "version",         :default => 0
    t.text     "comment"
    t.datetime "created_at",                     :null => false
  end

  add_index "audits", ["auditable_id", "auditable_type"], :name => "auditable_index"
  add_index "audits", ["created_at"], :name => "index_audits_on_created_at"
  add_index "audits", ["user_id", "user_type"], :name => "user_index"

  create_table "catalogo_catalogos", :force => true do |t|
    t.string   "tipo_catalogo_id"
    t.string   "nombre"
    t.string   "descripcion"
    t.integer  "orden"
    t.boolean  "activo"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "catalogo_tipo_catalogos", :force => true do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.string   "codigo"
    t.boolean  "activo"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "incidente_actividad_incidentes", :force => true do |t|
    t.integer  "incidente_id"
    t.date     "fecha_inicio"
    t.date     "fecha_fin"
    t.integer  "ci_utilizado_id"
    t.string   "resumen"
    t.string   "descripcion"
    t.integer  "soporte_ti_id"
    t.string   "resolucion"
    t.integer  "estado_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "incidente_incidentes", :force => true do |t|
    t.date     "fecha_incidente"
    t.date     "fecha_informe"
    t.integer  "modo_id"
    t.string   "resumen"
    t.string   "descripcion"
    t.integer  "ci_id"
    t.string   "direccion_division"
    t.string   "departamento_oficina"
    t.string   "seccion_unidad"
    t.integer  "grupo_id"
    t.integer  "prioridad_id"
    t.integer  "impacto_id"
    t.integer  "informado_por"
    t.integer  "tipo_incidente_id"
    t.string   "resolucion"
    t.integer  "estado_id"
    t.date     "fecha_registro"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "incidente_tipo_incidente_categoria_cis", :force => true do |t|
    t.integer  "categoria_ci_id"
    t.string   "descripcion_corta"
    t.string   "descripcion_larga"
    t.integer  "estado_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "peticion_peticion_servicio_tis", :force => true do |t|
    t.integer  "soporte_ci_id"
    t.date     "fecha_asignacion"
    t.integer  "estado_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "peticion_peticion_tis", :force => true do |t|
    t.string   "nombre_peticion_ti"
    t.string   "descripcion"
    t.integer  "usuario_ti_id"
    t.integer  "direccion_division_id"
    t.integer  "departamento_oficina_id"
    t.integer  "seccion_unidad_id"
    t.integer  "tipo_peticion_id"
    t.integer  "prioridad_id"
    t.string   "motivo_cancelacion"
    t.integer  "estado_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "peticion_servicio_tis", :force => true do |t|
    t.integer  "categoria_servicio_id"
    t.string   "nombre_servicio"
    t.string   "descripcion_servicio"
    t.integer  "servicio_padre_id"
    t.decimal  "costo_asociado",        :precision => 18, :scale => 0
    t.integer  "ci_id"
    t.string   "imagen"
    t.integer  "estado_id"
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
  end

  create_table "seguridad_menus", :force => true do |t|
    t.string   "nombre"
    t.integer  "recurso_id"
    t.integer  "modulo_id"
    t.integer  "menu_id"
    t.integer  "orden"
    t.boolean  "activo"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "seguridad_modulos", :force => true do |t|
    t.string   "nombre"
    t.string   "url_inicio"
    t.string   "url_imagen"
    t.boolean  "bloqueado"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "seguridad_permisos", :force => true do |t|
    t.integer  "role_id"
    t.integer  "usuario_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "seguridad_rol_menus", :force => true do |t|
    t.integer  "rol_id"
    t.integer  "menu_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "seguridad_roles", :force => true do |t|
    t.string   "nombre"
    t.boolean  "activo"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "seguridad_usuarios", :force => true do |t|
    t.string   "usuario"
    t.string   "nombres"
    t.string   "apellidos"
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
    t.string   "email",                                :default => "", :null => false
    t.string   "encrypted_password",                   :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "password",               :limit => 50
  end

  add_index "seguridad_usuarios", ["email"], :name => "index_seguridad_usuarios_on_email", :unique => true
  add_index "seguridad_usuarios", ["reset_password_token"], :name => "index_seguridad_usuarios_on_reset_password_token", :unique => true

end
