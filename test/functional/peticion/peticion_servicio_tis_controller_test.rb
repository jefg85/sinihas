require 'test_helper'

class Peticion::PeticionServicioTisControllerTest < ActionController::TestCase
  setup do
    @peticion_peticion_servicio_ti = peticion_peticion_servicio_tis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:peticion_peticion_servicio_tis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create peticion_peticion_servicio_ti" do
    assert_difference('Peticion::PeticionServicioTi.count') do
      post :create, peticion_peticion_servicio_ti: { estado_id: @peticion_peticion_servicio_ti.estado_id, fecha_asignacion: @peticion_peticion_servicio_ti.fecha_asignacion, soporte_ci_id: @peticion_peticion_servicio_ti.soporte_ci_id }
    end

    assert_redirected_to peticion_peticion_servicio_ti_path(assigns(:peticion_peticion_servicio_ti))
  end

  test "should show peticion_peticion_servicio_ti" do
    get :show, id: @peticion_peticion_servicio_ti
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @peticion_peticion_servicio_ti
    assert_response :success
  end

  test "should update peticion_peticion_servicio_ti" do
    put :update, id: @peticion_peticion_servicio_ti, peticion_peticion_servicio_ti: { estado_id: @peticion_peticion_servicio_ti.estado_id, fecha_asignacion: @peticion_peticion_servicio_ti.fecha_asignacion, soporte_ci_id: @peticion_peticion_servicio_ti.soporte_ci_id }
    assert_redirected_to peticion_peticion_servicio_ti_path(assigns(:peticion_peticion_servicio_ti))
  end

  test "should destroy peticion_peticion_servicio_ti" do
    assert_difference('Peticion::PeticionServicioTi.count', -1) do
      delete :destroy, id: @peticion_peticion_servicio_ti
    end

    assert_redirected_to peticion_peticion_servicio_tis_path
  end
end
