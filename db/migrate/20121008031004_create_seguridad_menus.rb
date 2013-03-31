class CreateSeguridadMenus < ActiveRecord::Migration
  def change
    create_table :seguridad_menus do |t|
      t.string :nombre
      t.integer :recurso_id
      t.integer :modulo_id
      t.integer :menu_id
      t.integer :orden
      t.boolean :activo

      t.timestamps
    end
  end
end
