class CreateActivoCategoriaCis < ActiveRecord::Migration
  def change
    create_table :activo_categoria_cis do |t|
      t.string :descripcion_corta
      t.string :descripcion_larga
      t.string :prefijo_nombramiento
      t.integer :nivel_i_id
      t.integer :nivel_ii_id
      t.integer :nivel_iii_id
      t.string :url_imagen
      t.integer :posicion
      t.date :fecha_inicio_vigencia
      t.date :fecha_fin_vigencia

      t.timestamps
    end
  end
end
