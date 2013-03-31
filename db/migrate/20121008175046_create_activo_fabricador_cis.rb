class CreateActivoFabricadorCis < ActiveRecord::Migration
  def change
    create_table :activo_fabricador_cis do |t|
      t.string :nombre_comercial
      t.string :pagina_web
      t.string :url_logo
      t.date :fecha_inicio_vigencia
      t.date :fecha_fin_vigencia

      t.timestamps
    end
  end
end
