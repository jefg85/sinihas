require 'test_helper'

class Activo::EspecificacionCisControllerTest < ActionController::TestCase
  setup do
    @activo_especificacion_ci = activo_especificacion_cis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:activo_especificacion_cis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create activo_especificacion_ci" do
    assert_difference('Activo::EspecificacionCi.count') do
      post :create, activo_especificacion_ci: { ci_id: @activo_especificacion_ci.ci_id, estado_id: @activo_especificacion_ci.estado_id, prop_esp_ci_id: @activo_especificacion_ci.prop_esp_ci_id, valor_binario: @activo_especificacion_ci.valor_binario, valor_cadena: @activo_especificacion_ci.valor_cadena, valor_logico: @activo_especificacion_ci.valor_logico, valor_numerico: @activo_especificacion_ci.valor_numerico, valor_real: @activo_especificacion_ci.valor_real }
    end

    assert_redirected_to activo_especificacion_ci_path(assigns(:activo_especificacion_ci))
  end

  test "should show activo_especificacion_ci" do
    get :show, id: @activo_especificacion_ci
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @activo_especificacion_ci
    assert_response :success
  end

  test "should update activo_especificacion_ci" do
    put :update, id: @activo_especificacion_ci, activo_especificacion_ci: { ci_id: @activo_especificacion_ci.ci_id, estado_id: @activo_especificacion_ci.estado_id, prop_esp_ci_id: @activo_especificacion_ci.prop_esp_ci_id, valor_binario: @activo_especificacion_ci.valor_binario, valor_cadena: @activo_especificacion_ci.valor_cadena, valor_logico: @activo_especificacion_ci.valor_logico, valor_numerico: @activo_especificacion_ci.valor_numerico, valor_real: @activo_especificacion_ci.valor_real }
    assert_redirected_to activo_especificacion_ci_path(assigns(:activo_especificacion_ci))
  end

  test "should destroy activo_especificacion_ci" do
    assert_difference('Activo::EspecificacionCi.count', -1) do
      delete :destroy, id: @activo_especificacion_ci
    end

    assert_redirected_to activo_especificacion_cis_path
  end
end
