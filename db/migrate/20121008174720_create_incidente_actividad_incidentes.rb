class CreateIncidenteActividadIncidentes < ActiveRecord::Migration
  def change
    create_table :incidente_actividad_incidentes do |t|
      t.integer :incidente_id
      t.date :fecha_inicio
      t.date :fecha_fin
      t.integer :ci_utilizado_id
      t.string :resumen
      t.string :descripcion
      t.integer :soporte_ti_id
      t.string :resolucion
      t.integer :estado_id

      t.timestamps
    end
  end
end
