class CreateSeguridadPermisos < ActiveRecord::Migration
  def change
    create_table :seguridad_permisos do |t|
      t.integer :role_id
      t.integer :usuario_id

      t.timestamps
    end
  end
end
