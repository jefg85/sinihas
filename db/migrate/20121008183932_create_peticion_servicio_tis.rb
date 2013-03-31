class CreatePeticionServicioTis < ActiveRecord::Migration
  def change
    create_table :peticion_servicio_tis do |t|
      t.integer :categoria_servicio_id
      t.string :nombre_servicio
      t.string :descripcion_servicio
      t.integer :servicio_padre_id
      t.decimal :costo_asociado
      t.integer :ci_id
      t.string :imagen
      t.integer :estado_id

      t.timestamps
    end
  end
end
