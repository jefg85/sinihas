require 'test_helper'

class Seguridad::ModulosControllerTest < ActionController::TestCase
  setup do
    @seguridad_modulo = seguridad_modulos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:seguridad_modulos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create seguridad_modulo" do
    assert_difference('Seguridad::Modulo.count') do
      post :create, seguridad_modulo: { bloqueado: @seguridad_modulo.bloqueado, nombre: @seguridad_modulo.nombre, url_imagen: @seguridad_modulo.url_imagen, url_inicio: @seguridad_modulo.url_inicio }
    end

    assert_redirected_to seguridad_modulo_path(assigns(:seguridad_modulo))
  end

  test "should show seguridad_modulo" do
    get :show, id: @seguridad_modulo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @seguridad_modulo
    assert_response :success
  end

  test "should update seguridad_modulo" do
    put :update, id: @seguridad_modulo, seguridad_modulo: { bloqueado: @seguridad_modulo.bloqueado, nombre: @seguridad_modulo.nombre, url_imagen: @seguridad_modulo.url_imagen, url_inicio: @seguridad_modulo.url_inicio }
    assert_redirected_to seguridad_modulo_path(assigns(:seguridad_modulo))
  end

  test "should destroy seguridad_modulo" do
    assert_difference('Seguridad::Modulo.count', -1) do
      delete :destroy, id: @seguridad_modulo
    end

    assert_redirected_to seguridad_modulos_path
  end
end
