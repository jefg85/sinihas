require 'test_helper'

class Seguridad::ConfiguracionsControllerTest < ActionController::TestCase
  setup do
    @seguridad_configuracion = seguridad_configuracions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:seguridad_configuracions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create seguridad_configuracion" do
    assert_difference('Seguridad::Configuracion.count') do
      post :create, seguridad_configuracion: { codigo: @seguridad_configuracion.codigo, nombre: @seguridad_configuracion.nombre, valor: @seguridad_configuracion.valor }
    end

    assert_redirected_to seguridad_configuracion_path(assigns(:seguridad_configuracion))
  end

  test "should show seguridad_configuracion" do
    get :show, id: @seguridad_configuracion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @seguridad_configuracion
    assert_response :success
  end

  test "should update seguridad_configuracion" do
    put :update, id: @seguridad_configuracion, seguridad_configuracion: { codigo: @seguridad_configuracion.codigo, nombre: @seguridad_configuracion.nombre, valor: @seguridad_configuracion.valor }
    assert_redirected_to seguridad_configuracion_path(assigns(:seguridad_configuracion))
  end

  test "should destroy seguridad_configuracion" do
    assert_difference('Seguridad::Configuracion.count', -1) do
      delete :destroy, id: @seguridad_configuracion
    end

    assert_redirected_to seguridad_configuracions_path
  end
end
