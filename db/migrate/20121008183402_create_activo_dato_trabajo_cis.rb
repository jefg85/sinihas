class CreateActivoDatoTrabajoCis < ActiveRecord::Migration
  def change
    create_table :activo_dato_trabajo_cis do |t|
      t.integer :tipo_informacion_trabajo_id
      t.date :fecha
      t.integer :fuente_id
      t.string :resumen
      t.string :documento_adjunto

      t.timestamps
    end
  end
end
