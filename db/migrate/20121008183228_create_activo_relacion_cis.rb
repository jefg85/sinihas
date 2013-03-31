class CreateActivoRelacionCis < ActiveRecord::Migration
  def change
    create_table :activo_relacion_cis do |t|
      t.integer :ci_id
      t.integer :relacion_id
      t.integer :ci_relacion_id
      t.date :fecha
      t.integer :estado_id

      t.timestamps
    end
  end
end
