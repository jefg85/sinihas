require 'test_helper'

class Activo::CisControllerTest < ActionController::TestCase
  setup do
    @activo_ci = activo_cis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:activo_cis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create activo_ci" do
    assert_difference('Activo::Ci.count') do
      post :create, activo_ci: { categoria_nivel_i_id: @activo_ci.categoria_nivel_i_id, categoria_nivel_ii_id: @activo_ci.categoria_nivel_ii_id, categoria_nivel_iii: @activo_ci.categoria_nivel_iii, codigo_inventario: @activo_ci.codigo_inventario, departamento_oficina_id: @activo_ci.departamento_oficina_id, descripcion: @activo_ci.descripcion, direccion_division_id: @activo_ci.direccion_division_id, edificio_id: @activo_ci.edificio_id, fabricador_id: @activo_ci.fabricador_id, impacto_id: @activo_ci.impacto_id, informacion_adicional: @activo_ci.informacion_adicional, modelo_version: @activo_ci.modelo_version, nombre: @activo_ci.nombre, nombre_producto: @activo_ci.nombre_producto, numero_parte: @activo_ci.numero_parte, numero_serial: @activo_ci.numero_serial, prioridad_id: @activo_ci.prioridad_id, proveedor_id: @activo_ci.proveedor_id, seccion_unidad_id: @activo_ci.seccion_unidad_id, soporte: @activo_ci.soporte, urgencia_id: @activo_ci.urgencia_id, usuarios_afectados: @activo_ci.usuarios_afectados }
    end

    assert_redirected_to activo_ci_path(assigns(:activo_ci))
  end

  test "should show activo_ci" do
    get :show, id: @activo_ci
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @activo_ci
    assert_response :success
  end

  test "should update activo_ci" do
    put :update, id: @activo_ci, activo_ci: { categoria_nivel_i_id: @activo_ci.categoria_nivel_i_id, categoria_nivel_ii_id: @activo_ci.categoria_nivel_ii_id, categoria_nivel_iii: @activo_ci.categoria_nivel_iii, codigo_inventario: @activo_ci.codigo_inventario, departamento_oficina_id: @activo_ci.departamento_oficina_id, descripcion: @activo_ci.descripcion, direccion_division_id: @activo_ci.direccion_division_id, edificio_id: @activo_ci.edificio_id, fabricador_id: @activo_ci.fabricador_id, impacto_id: @activo_ci.impacto_id, informacion_adicional: @activo_ci.informacion_adicional, modelo_version: @activo_ci.modelo_version, nombre: @activo_ci.nombre, nombre_producto: @activo_ci.nombre_producto, numero_parte: @activo_ci.numero_parte, numero_serial: @activo_ci.numero_serial, prioridad_id: @activo_ci.prioridad_id, proveedor_id: @activo_ci.proveedor_id, seccion_unidad_id: @activo_ci.seccion_unidad_id, soporte: @activo_ci.soporte, urgencia_id: @activo_ci.urgencia_id, usuarios_afectados: @activo_ci.usuarios_afectados }
    assert_redirected_to activo_ci_path(assigns(:activo_ci))
  end

  test "should destroy activo_ci" do
    assert_difference('Activo::Ci.count', -1) do
      delete :destroy, id: @activo_ci
    end

    assert_redirected_to activo_cis_path
  end
end
