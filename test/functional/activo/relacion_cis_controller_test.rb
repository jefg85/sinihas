require 'test_helper'

class Activo::RelacionCisControllerTest < ActionController::TestCase
  setup do
    @activo_relacion_ci = activo_relacion_cis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:activo_relacion_cis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create activo_relacion_ci" do
    assert_difference('Activo::RelacionCi.count') do
      post :create, activo_relacion_ci: { ci_id: @activo_relacion_ci.ci_id, ci_relacion_id: @activo_relacion_ci.ci_relacion_id, estado_id: @activo_relacion_ci.estado_id, fecha: @activo_relacion_ci.fecha, relacion_id: @activo_relacion_ci.relacion_id }
    end

    assert_redirected_to activo_relacion_ci_path(assigns(:activo_relacion_ci))
  end

  test "should show activo_relacion_ci" do
    get :show, id: @activo_relacion_ci
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @activo_relacion_ci
    assert_response :success
  end

  test "should update activo_relacion_ci" do
    put :update, id: @activo_relacion_ci, activo_relacion_ci: { ci_id: @activo_relacion_ci.ci_id, ci_relacion_id: @activo_relacion_ci.ci_relacion_id, estado_id: @activo_relacion_ci.estado_id, fecha: @activo_relacion_ci.fecha, relacion_id: @activo_relacion_ci.relacion_id }
    assert_redirected_to activo_relacion_ci_path(assigns(:activo_relacion_ci))
  end

  test "should destroy activo_relacion_ci" do
    assert_difference('Activo::RelacionCi.count', -1) do
      delete :destroy, id: @activo_relacion_ci
    end

    assert_redirected_to activo_relacion_cis_path
  end
end
