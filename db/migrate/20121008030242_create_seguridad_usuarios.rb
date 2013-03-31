class CreateSeguridadUsuarios < ActiveRecord::Migration
  def change
    create_table :seguridad_usuarios do |t|
      t.string :usuario
      t.string :nombres
      t.string :apellidos

      t.timestamps
    end
  end
end
