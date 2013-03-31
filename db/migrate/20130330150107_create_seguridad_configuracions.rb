class CreateSeguridadConfiguracions < ActiveRecord::Migration
  def change
    create_table :seguridad_configuracions do |t|
      t.string :codigo
      t.string :nombre
      t.string :valor

      t.timestamps
    end
  end
end
