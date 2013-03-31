class CreateCatalogoTipoCatalogos < ActiveRecord::Migration
  def change
    create_table :catalogo_tipo_catalogos do |t|
      t.string :nombre
      t.string :descripcion
      t.string :codigo
      t.boolean :activo

      t.timestamps
    end
  end
end
