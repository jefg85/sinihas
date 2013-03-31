class CreateActivoEspecificacionCis < ActiveRecord::Migration
  def change
    create_table :activo_especificacion_cis do |t|
      t.integer :ci_id
      t.integer :prop_esp_ci_id
      t.string :valor_cadena
      t.string :valor_logico
      t.integer :valor_numerico
      t.decimal :valor_real
      t.string :valor_binario
      t.integer :estado_id

      t.timestamps
    end
  end
end
