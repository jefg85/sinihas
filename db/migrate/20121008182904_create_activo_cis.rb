class CreateActivoCis < ActiveRecord::Migration
  def change
    create_table :activo_cis do |t|
      t.string :nombre
      t.string :descripcion
      t.string :codigo_inventario
      t.string :numero_serial
      t.integer :numero_parte
      t.boolean :soporte
      t.integer :impacto_id
      t.integer :urgencia_id
      t.integer :prioridad_id
      t.string :usuarios_afectados
      t.string :informacion_adicional
      t.integer :categoria_nivel_i_id
      t.integer :categoria_nivel_ii_id
      t.integer :categoria_nivel_iii
      t.string :nombre_producto
      t.string :modelo_version
      t.integer :fabricador_id
      t.integer :proveedor_id
      t.integer :direccion_division_id
      t.integer :departamento_oficina_id
      t.integer :seccion_unidad_id
      t.integer :edificio_id

      t.timestamps
    end
  end
end
