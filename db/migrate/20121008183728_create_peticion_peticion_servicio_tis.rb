class CreatePeticionPeticionServicioTis < ActiveRecord::Migration
  def change
    create_table :peticion_peticion_servicio_tis do |t|
      t.integer :soporte_ci_id
      t.date :fecha_asignacion
      t.integer :estado_id

      t.timestamps
    end
  end
end
