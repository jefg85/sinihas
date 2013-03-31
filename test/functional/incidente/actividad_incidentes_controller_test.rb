require 'test_helper'

class Incidente::ActividadIncidentesControllerTest < ActionController::TestCase
  setup do
    @incidente_actividad_incidente = incidente_actividad_incidentes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:incidente_actividad_incidentes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create incidente_actividad_incidente" do
    assert_difference('Incidente::ActividadIncidente.count') do
      post :create, incidente_actividad_incidente: { ci_utilizado_id: @incidente_actividad_incidente.ci_utilizado_id, descripcion: @incidente_actividad_incidente.descripcion, estado_id: @incidente_actividad_incidente.estado_id, fecha_fin: @incidente_actividad_incidente.fecha_fin, fecha_inicio: @incidente_actividad_incidente.fecha_inicio, incidente_id: @incidente_actividad_incidente.incidente_id, resolucion: @incidente_actividad_incidente.resolucion, resumen: @incidente_actividad_incidente.resumen, soporte_ti_id: @incidente_actividad_incidente.soporte_ti_id }
    end

    assert_redirected_to incidente_actividad_incidente_path(assigns(:incidente_actividad_incidente))
  end

  test "should show incidente_actividad_incidente" do
    get :show, id: @incidente_actividad_incidente
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @incidente_actividad_incidente
    assert_response :success
  end

  test "should update incidente_actividad_incidente" do
    put :update, id: @incidente_actividad_incidente, incidente_actividad_incidente: { ci_utilizado_id: @incidente_actividad_incidente.ci_utilizado_id, descripcion: @incidente_actividad_incidente.descripcion, estado_id: @incidente_actividad_incidente.estado_id, fecha_fin: @incidente_actividad_incidente.fecha_fin, fecha_inicio: @incidente_actividad_incidente.fecha_inicio, incidente_id: @incidente_actividad_incidente.incidente_id, resolucion: @incidente_actividad_incidente.resolucion, resumen: @incidente_actividad_incidente.resumen, soporte_ti_id: @incidente_actividad_incidente.soporte_ti_id }
    assert_redirected_to incidente_actividad_incidente_path(assigns(:incidente_actividad_incidente))
  end

  test "should destroy incidente_actividad_incidente" do
    assert_difference('Incidente::ActividadIncidente.count', -1) do
      delete :destroy, id: @incidente_actividad_incidente
    end

    assert_redirected_to incidente_actividad_incidentes_path
  end
end
