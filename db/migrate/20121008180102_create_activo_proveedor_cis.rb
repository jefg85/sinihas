class CreateActivoProveedorCis < ActiveRecord::Migration
  def change
    create_table :activo_proveedor_cis do |t|
      t.string :nit
      t.string :nombre_comercial
      t.string :sigla
      t.string :tipo_proveedor_id
      t.string :direccion
      t.string :telefono_convencional
      t.string :telefono_celular
      t.string :telefono_fax
      t.string :pagina_web
      t.string :url_logo
      t.date :fecha_inicio_vigencia
      t.date :fecha_fin_vigencia

      t.timestamps
    end
  end
end
