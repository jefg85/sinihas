class CreateCatalogoCatalogos < ActiveRecord::Migration
  def change
    create_table :catalogo_catalogos do |t|
      t.string :tipo_catalogo_id
      t.string :nombre
      t.string :descripcion
      t.integer :orden
      t.boolean :activo

      t.timestamps
    end
  end
end
