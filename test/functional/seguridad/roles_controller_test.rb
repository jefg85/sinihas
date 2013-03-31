require 'test_helper'

class Seguridad::RolesControllerTest < ActionController::TestCase
  setup do
    @seguridad_role = seguridad_roles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:seguridad_roles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create seguridad_role" do
    assert_difference('Seguridad::Role.count') do
      post :create, seguridad_role: { activo: @seguridad_role.activo, nombre: @seguridad_role.nombre }
    end

    assert_redirected_to seguridad_role_path(assigns(:seguridad_role))
  end

  test "should show seguridad_role" do
    get :show, id: @seguridad_role
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @seguridad_role
    assert_response :success
  end

  test "should update seguridad_role" do
    put :update, id: @seguridad_role, seguridad_role: { activo: @seguridad_role.activo, nombre: @seguridad_role.nombre }
    assert_redirected_to seguridad_role_path(assigns(:seguridad_role))
  end

  test "should destroy seguridad_role" do
    assert_difference('Seguridad::Role.count', -1) do
      delete :destroy, id: @seguridad_role
    end

    assert_redirected_to seguridad_roles_path
  end
end
