class CreateActivoPropiedadEspecificaCategoriaCis < ActiveRecord::Migration
  def change
    create_table :activo_propiedad_especifica_categoria_cis do |t|
      t.integer :categoria_ci_id
      t.integer :prop_espc_ci
      t.integer :estado_id

      t.timestamps
    end
  end
end
