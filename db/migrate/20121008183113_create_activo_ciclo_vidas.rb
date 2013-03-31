class CreateActivoCicloVidas < ActiveRecord::Migration
  def change
    create_table :activo_ciclo_vidas do |t|
      t.integer :ci_id
      t.string :operacion
      t.integer :estado_categoria_ci_id
      t.integer :responsable_id
      t.date :fecha
      t.string :observaciones
      t.integer :orden
      t.integer :estado_id

      t.timestamps
    end
  end
end
