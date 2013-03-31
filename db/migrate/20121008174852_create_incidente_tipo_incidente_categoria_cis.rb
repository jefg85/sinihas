class CreateIncidenteTipoIncidenteCategoriaCis < ActiveRecord::Migration
  def change
    create_table :incidente_tipo_incidente_categoria_cis do |t|
      t.integer :categoria_ci_id
      t.string :descripcion_corta
      t.string :descripcion_larga
      t.integer :estado_id

      t.timestamps
    end
  end
end
