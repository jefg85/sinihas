require 'test_helper'

class Activo::CicloVidasControllerTest < ActionController::TestCase
  setup do
    @activo_ciclo_vida = activo_ciclo_vidas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:activo_ciclo_vidas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create activo_ciclo_vida" do
    assert_difference('Activo::CicloVida.count') do
      post :create, activo_ciclo_vida: { ci_id: @activo_ciclo_vida.ci_id, estado_categoria_ci_id: @activo_ciclo_vida.estado_categoria_ci_id, estado_id: @activo_ciclo_vida.estado_id, fecha: @activo_ciclo_vida.fecha, observaciones: @activo_ciclo_vida.observaciones, operacion: @activo_ciclo_vida.operacion, orden: @activo_ciclo_vida.orden, responsable_id: @activo_ciclo_vida.responsable_id }
    end

    assert_redirected_to activo_ciclo_vida_path(assigns(:activo_ciclo_vida))
  end

  test "should show activo_ciclo_vida" do
    get :show, id: @activo_ciclo_vida
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @activo_ciclo_vida
    assert_response :success
  end

  test "should update activo_ciclo_vida" do
    put :update, id: @activo_ciclo_vida, activo_ciclo_vida: { ci_id: @activo_ciclo_vida.ci_id, estado_categoria_ci_id: @activo_ciclo_vida.estado_categoria_ci_id, estado_id: @activo_ciclo_vida.estado_id, fecha: @activo_ciclo_vida.fecha, observaciones: @activo_ciclo_vida.observaciones, operacion: @activo_ciclo_vida.operacion, orden: @activo_ciclo_vida.orden, responsable_id: @activo_ciclo_vida.responsable_id }
    assert_redirected_to activo_ciclo_vida_path(assigns(:activo_ciclo_vida))
  end

  test "should destroy activo_ciclo_vida" do
    assert_difference('Activo::CicloVida.count', -1) do
      delete :destroy, id: @activo_ciclo_vida
    end

    assert_redirected_to activo_ciclo_vidas_path
  end
end
