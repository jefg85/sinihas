require 'test_helper'

class Peticion::PeticionTisControllerTest < ActionController::TestCase
  setup do
    @peticion_peticion_ti = peticion_peticion_tis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:peticion_peticion_tis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create peticion_peticion_ti" do
    assert_difference('Peticion::PeticionTi.count') do
      post :create, peticion_peticion_ti: { departamento_oficina_id: @peticion_peticion_ti.departamento_oficina_id, descripcion: @peticion_peticion_ti.descripcion, direccion_division_id: @peticion_peticion_ti.direccion_division_id, estado_id: @peticion_peticion_ti.estado_id, motivo_cancelacion: @peticion_peticion_ti.motivo_cancelacion, nombre_peticion_ti: @peticion_peticion_ti.nombre_peticion_ti, prioridad_id: @peticion_peticion_ti.prioridad_id, seccion_unidad_id: @peticion_peticion_ti.seccion_unidad_id, tipo_peticion_id: @peticion_peticion_ti.tipo_peticion_id, usuario_ti_id: @peticion_peticion_ti.usuario_ti_id }
    end

    assert_redirected_to peticion_peticion_ti_path(assigns(:peticion_peticion_ti))
  end

  test "should show peticion_peticion_ti" do
    get :show, id: @peticion_peticion_ti
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @peticion_peticion_ti
    assert_response :success
  end

  test "should update peticion_peticion_ti" do
    put :update, id: @peticion_peticion_ti, peticion_peticion_ti: { departamento_oficina_id: @peticion_peticion_ti.departamento_oficina_id, descripcion: @peticion_peticion_ti.descripcion, direccion_division_id: @peticion_peticion_ti.direccion_division_id, estado_id: @peticion_peticion_ti.estado_id, motivo_cancelacion: @peticion_peticion_ti.motivo_cancelacion, nombre_peticion_ti: @peticion_peticion_ti.nombre_peticion_ti, prioridad_id: @peticion_peticion_ti.prioridad_id, seccion_unidad_id: @peticion_peticion_ti.seccion_unidad_id, tipo_peticion_id: @peticion_peticion_ti.tipo_peticion_id, usuario_ti_id: @peticion_peticion_ti.usuario_ti_id }
    assert_redirected_to peticion_peticion_ti_path(assigns(:peticion_peticion_ti))
  end

  test "should destroy peticion_peticion_ti" do
    assert_difference('Peticion::PeticionTi.count', -1) do
      delete :destroy, id: @peticion_peticion_ti
    end

    assert_redirected_to peticion_peticion_tis_path
  end
end
