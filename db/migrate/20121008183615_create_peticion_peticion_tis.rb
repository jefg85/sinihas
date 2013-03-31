class CreatePeticionPeticionTis < ActiveRecord::Migration
  def change
    create_table :peticion_peticion_tis do |t|
      t.string :nombre_peticion_ti
      t.string :descripcion
      t.integer :usuario_ti_id
      t.integer :direccion_division_id
      t.integer :departamento_oficina_id
      t.integer :seccion_unidad_id
      t.integer :tipo_peticion_id
      t.integer :prioridad_id
      t.string :motivo_cancelacion
      t.integer :estado_id

      t.timestamps
    end
  end
end
