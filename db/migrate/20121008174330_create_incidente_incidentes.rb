class CreateIncidenteIncidentes < ActiveRecord::Migration
  def change
    create_table :incidente_incidentes do |t|
      t.date :fecha_incidente
      t.date :fecha_informe
      t.integer :modo_id
      t.string :resumen
      t.string :descripcion
      t.integer :ci_id
      t.string :direccion_division
      t.string :departamento_oficina
      t.string :seccion_unidad
      t.integer :grupo_id
      t.integer :prioridad_id
      t.integer :impacto_id
      t.integer :informado_por
      t.integer :tipo_incidente_id
      t.string :resolucion
      t.integer :estado_id
      t.date :fecha_registro

      t.timestamps
    end
  end
end
