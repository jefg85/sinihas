require 'test_helper'

class Activo::EstadoCisControllerTest < ActionController::TestCase
  setup do
    @activo_estado_ci = activo_estado_cis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:activo_estado_cis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create activo_estado_ci" do
    assert_difference('Activo::EstadoCi.count') do
      post :create, activo_estado_ci: { color: @activo_estado_ci.color, descripcion: @activo_estado_ci.descripcion, fecha_fin_vigencia: @activo_estado_ci.fecha_fin_vigencia, fecha_inicio_vigencia: @activo_estado_ci.fecha_inicio_vigencia, nombre: @activo_estado_ci.nombre }
    end

    assert_redirected_to activo_estado_ci_path(assigns(:activo_estado_ci))
  end

  test "should show activo_estado_ci" do
    get :show, id: @activo_estado_ci
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @activo_estado_ci
    assert_response :success
  end

  test "should update activo_estado_ci" do
    put :update, id: @activo_estado_ci, activo_estado_ci: { color: @activo_estado_ci.color, descripcion: @activo_estado_ci.descripcion, fecha_fin_vigencia: @activo_estado_ci.fecha_fin_vigencia, fecha_inicio_vigencia: @activo_estado_ci.fecha_inicio_vigencia, nombre: @activo_estado_ci.nombre }
    assert_redirected_to activo_estado_ci_path(assigns(:activo_estado_ci))
  end

  test "should destroy activo_estado_ci" do
    assert_difference('Activo::EstadoCi.count', -1) do
      delete :destroy, id: @activo_estado_ci
    end

    assert_redirected_to activo_estado_cis_path
  end
end
