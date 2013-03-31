require 'test_helper'

class Seguridad::UsuariosControllerTest < ActionController::TestCase
  setup do
    @seguridad_usuario = seguridad_usuarios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:seguridad_usuarios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create seguridad_usuario" do
    assert_difference('Seguridad::Usuario.count') do
      post :create, seguridad_usuario: { apellidos: @seguridad_usuario.apellidos, nombres: @seguridad_usuario.nombres, usuario: @seguridad_usuario.usuario }
    end

    assert_redirected_to seguridad_usuario_path(assigns(:seguridad_usuario))
  end

  test "should show seguridad_usuario" do
    get :show, id: @seguridad_usuario
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @seguridad_usuario
    assert_response :success
  end

  test "should update seguridad_usuario" do
    put :update, id: @seguridad_usuario, seguridad_usuario: { apellidos: @seguridad_usuario.apellidos, nombres: @seguridad_usuario.nombres, usuario: @seguridad_usuario.usuario }
    assert_redirected_to seguridad_usuario_path(assigns(:seguridad_usuario))
  end

  test "should destroy seguridad_usuario" do
    assert_difference('Seguridad::Usuario.count', -1) do
      delete :destroy, id: @seguridad_usuario
    end

    assert_redirected_to seguridad_usuarios_path
  end
end
