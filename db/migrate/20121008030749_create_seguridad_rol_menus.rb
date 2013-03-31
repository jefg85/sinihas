class CreateSeguridadRolMenus < ActiveRecord::Migration
  def change
    create_table :seguridad_rol_menus do |t|
      t.integer :rol_id
      t.integer :menu_id

      t.timestamps
    end
  end
end
