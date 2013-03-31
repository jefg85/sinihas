require 'test_helper'

class Peticion::ServicioTisControllerTest < ActionController::TestCase
  setup do
    @peticion_servicio_ti = peticion_servicio_tis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:peticion_servicio_tis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create peticion_servicio_ti" do
    assert_difference('Peticion::ServicioTi.count') do
      post :create, peticion_servicio_ti: { categoria_servicio_id: @peticion_servicio_ti.categoria_servicio_id, ci_id: @peticion_servicio_ti.ci_id, costo_asociado: @peticion_servicio_ti.costo_asociado, descripcion_servicio: @peticion_servicio_ti.descripcion_servicio, estado_id: @peticion_servicio_ti.estado_id, imagen: @peticion_servicio_ti.imagen, nombre_servicio: @peticion_servicio_ti.nombre_servicio, servicio_padre_id: @peticion_servicio_ti.servicio_padre_id }
    end

    assert_redirected_to peticion_servicio_ti_path(assigns(:peticion_servicio_ti))
  end

  test "should show peticion_servicio_ti" do
    get :show, id: @peticion_servicio_ti
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @peticion_servicio_ti
    assert_response :success
  end

  test "should update peticion_servicio_ti" do
    put :update, id: @peticion_servicio_ti, peticion_servicio_ti: { categoria_servicio_id: @peticion_servicio_ti.categoria_servicio_id, ci_id: @peticion_servicio_ti.ci_id, costo_asociado: @peticion_servicio_ti.costo_asociado, descripcion_servicio: @peticion_servicio_ti.descripcion_servicio, estado_id: @peticion_servicio_ti.estado_id, imagen: @peticion_servicio_ti.imagen, nombre_servicio: @peticion_servicio_ti.nombre_servicio, servicio_padre_id: @peticion_servicio_ti.servicio_padre_id }
    assert_redirected_to peticion_servicio_ti_path(assigns(:peticion_servicio_ti))
  end

  test "should destroy peticion_servicio_ti" do
    assert_difference('Peticion::ServicioTi.count', -1) do
      delete :destroy, id: @peticion_servicio_ti
    end

    assert_redirected_to peticion_servicio_tis_path
  end
end
