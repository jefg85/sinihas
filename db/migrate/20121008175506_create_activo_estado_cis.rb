class CreateActivoEstadoCis < ActiveRecord::Migration
  def change
    create_table :activo_estado_cis do |t|
      t.string :nombre
      t.string :descripcion
      t.string :color
      t.date :fecha_inicio_vigencia
      t.date :fecha_fin_vigencia

      t.timestamps
    end
  end
end
