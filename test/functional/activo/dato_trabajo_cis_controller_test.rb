require 'test_helper'

class Activo::DatoTrabajoCisControllerTest < ActionController::TestCase
  setup do
    @activo_dato_trabajo_ci = activo_dato_trabajo_cis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:activo_dato_trabajo_cis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create activo_dato_trabajo_ci" do
    assert_difference('Activo::DatoTrabajoCi.count') do
      post :create, activo_dato_trabajo_ci: { documento_adjunto: @activo_dato_trabajo_ci.documento_adjunto, fecha: @activo_dato_trabajo_ci.fecha, fuente_id: @activo_dato_trabajo_ci.fuente_id, resumen: @activo_dato_trabajo_ci.resumen, tipo_informacion_trabajo_id: @activo_dato_trabajo_ci.tipo_informacion_trabajo_id }
    end

    assert_redirected_to activo_dato_trabajo_ci_path(assigns(:activo_dato_trabajo_ci))
  end

  test "should show activo_dato_trabajo_ci" do
    get :show, id: @activo_dato_trabajo_ci
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @activo_dato_trabajo_ci
    assert_response :success
  end

  test "should update activo_dato_trabajo_ci" do
    put :update, id: @activo_dato_trabajo_ci, activo_dato_trabajo_ci: { documento_adjunto: @activo_dato_trabajo_ci.documento_adjunto, fecha: @activo_dato_trabajo_ci.fecha, fuente_id: @activo_dato_trabajo_ci.fuente_id, resumen: @activo_dato_trabajo_ci.resumen, tipo_informacion_trabajo_id: @activo_dato_trabajo_ci.tipo_informacion_trabajo_id }
    assert_redirected_to activo_dato_trabajo_ci_path(assigns(:activo_dato_trabajo_ci))
  end

  test "should destroy activo_dato_trabajo_ci" do
    assert_difference('Activo::DatoTrabajoCi.count', -1) do
      delete :destroy, id: @activo_dato_trabajo_ci
    end

    assert_redirected_to activo_dato_trabajo_cis_path
  end
end
