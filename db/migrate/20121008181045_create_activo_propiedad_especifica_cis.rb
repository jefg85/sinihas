class CreateActivoPropiedadEspecificaCis < ActiveRecord::Migration
  def change
    create_table :activo_propiedad_especifica_cis do |t|
      t.string :nombre_campo
      t.integer :tipo_campo
      t.string :valor_string
      t.boolean :visualizar
      t.date :fecha_inicio_vigencia
      t.date :fecha_fin_vigencia

      t.timestamps
    end
  end
end
