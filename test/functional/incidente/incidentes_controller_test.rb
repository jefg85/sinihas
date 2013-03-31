require 'test_helper'

class Incidente::IncidentesControllerTest < ActionController::TestCase
  setup do
    @incidente_incidente = incidente_incidentes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:incidente_incidentes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create incidente_incidente" do
    assert_difference('Incidente::Incidente.count') do
      post :create, incidente_incidente: { ci_id: @incidente_incidente.ci_id, departamento_oficina: @incidente_incidente.departamento_oficina, descripcion: @incidente_incidente.descripcion, direccion_division: @incidente_incidente.direccion_division, estado_id: @incidente_incidente.estado_id, fecha_incidente: @incidente_incidente.fecha_incidente, fecha_informe: @incidente_incidente.fecha_informe, fecha_registro: @incidente_incidente.fecha_registro, grupo_id: @incidente_incidente.grupo_id, impacto_id: @incidente_incidente.impacto_id, informado_por: @incidente_incidente.informado_por, modo_id: @incidente_incidente.modo_id, prioridad_id: @incidente_incidente.prioridad_id, resolucion: @incidente_incidente.resolucion, resumen: @incidente_incidente.resumen, seccion_unidad: @incidente_incidente.seccion_unidad, tipo_incidente_id: @incidente_incidente.tipo_incidente_id }
    end

    assert_redirected_to incidente_incidente_path(assigns(:incidente_incidente))
  end

  test "should show incidente_incidente" do
    get :show, id: @incidente_incidente
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @incidente_incidente
    assert_response :success
  end

  test "should update incidente_incidente" do
    put :update, id: @incidente_incidente, incidente_incidente: { ci_id: @incidente_incidente.ci_id, departamento_oficina: @incidente_incidente.departamento_oficina, descripcion: @incidente_incidente.descripcion, direccion_division: @incidente_incidente.direccion_division, estado_id: @incidente_incidente.estado_id, fecha_incidente: @incidente_incidente.fecha_incidente, fecha_informe: @incidente_incidente.fecha_informe, fecha_registro: @incidente_incidente.fecha_registro, grupo_id: @incidente_incidente.grupo_id, impacto_id: @incidente_incidente.impacto_id, informado_por: @incidente_incidente.informado_por, modo_id: @incidente_incidente.modo_id, prioridad_id: @incidente_incidente.prioridad_id, resolucion: @incidente_incidente.resolucion, resumen: @incidente_incidente.resumen, seccion_unidad: @incidente_incidente.seccion_unidad, tipo_incidente_id: @incidente_incidente.tipo_incidente_id }
    assert_redirected_to incidente_incidente_path(assigns(:incidente_incidente))
  end

  test "should destroy incidente_incidente" do
    assert_difference('Incidente::Incidente.count', -1) do
      delete :destroy, id: @incidente_incidente
    end

    assert_redirected_to incidente_incidentes_path
  end
end
