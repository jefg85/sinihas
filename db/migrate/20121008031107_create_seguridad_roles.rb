class CreateSeguridadRoles < ActiveRecord::Migration
  def change
    create_table :seguridad_roles do |t|
      t.string :nombre
      t.boolean :activo

      t.timestamps
    end
  end
end
