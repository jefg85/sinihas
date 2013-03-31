class CreateSeguridadModulos < ActiveRecord::Migration
  def change
    create_table :seguridad_modulos do |t|
      t.string :nombre
      t.string :url_inicio
      t.string :url_imagen
      t.boolean :bloqueado

      t.timestamps
    end
  end
end
