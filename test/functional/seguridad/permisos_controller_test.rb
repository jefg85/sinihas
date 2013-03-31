require 'test_helper'

class Seguridad::PermisosControllerTest < ActionController::TestCase
  setup do
    @seguridad_permiso = seguridad_permisos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:seguridad_permisos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create seguridad_permiso" do
    assert_difference('Seguridad::Permiso.count') do
      post :create, seguridad_permiso: { role_id: @seguridad_permiso.role_id, usuario_id: @seguridad_permiso.usuario_id }
    end

    assert_redirected_to seguridad_permiso_path(assigns(:seguridad_permiso))
  end

  test "should show seguridad_permiso" do
    get :show, id: @seguridad_permiso
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @seguridad_permiso
    assert_response :success
  end

  test "should update seguridad_permiso" do
    put :update, id: @seguridad_permiso, seguridad_permiso: { role_id: @seguridad_permiso.role_id, usuario_id: @seguridad_permiso.usuario_id }
    assert_redirected_to seguridad_permiso_path(assigns(:seguridad_permiso))
  end

  test "should destroy seguridad_permiso" do
    assert_difference('Seguridad::Permiso.count', -1) do
      delete :destroy, id: @seguridad_permiso
    end

    assert_redirected_to seguridad_permisos_path
  end
end
