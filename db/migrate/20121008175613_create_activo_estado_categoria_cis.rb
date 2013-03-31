class CreateActivoEstadoCategoriaCis < ActiveRecord::Migration
  def change
    create_table :activo_estado_categoria_cis do |t|
      t.integer :categoria_ci_id
      t.integer :estado_ci_id
      t.integer :estado_id

      t.timestamps
    end
  end
end
