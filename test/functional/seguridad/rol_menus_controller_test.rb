require 'test_helper'

class Seguridad::RolMenusControllerTest < ActionController::TestCase
  setup do
    @seguridad_rol_menu = seguridad_rol_menus(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:seguridad_rol_menus)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create seguridad_rol_menu" do
    assert_difference('Seguridad::RolMenu.count') do
      post :create, seguridad_rol_menu: { menu_id: @seguridad_rol_menu.menu_id, rol_id: @seguridad_rol_menu.rol_id }
    end

    assert_redirected_to seguridad_rol_menu_path(assigns(:seguridad_rol_menu))
  end

  test "should show seguridad_rol_menu" do
    get :show, id: @seguridad_rol_menu
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @seguridad_rol_menu
    assert_response :success
  end

  test "should update seguridad_rol_menu" do
    put :update, id: @seguridad_rol_menu, seguridad_rol_menu: { menu_id: @seguridad_rol_menu.menu_id, rol_id: @seguridad_rol_menu.rol_id }
    assert_redirected_to seguridad_rol_menu_path(assigns(:seguridad_rol_menu))
  end

  test "should destroy seguridad_rol_menu" do
    assert_difference('Seguridad::RolMenu.count', -1) do
      delete :destroy, id: @seguridad_rol_menu
    end

    assert_redirected_to seguridad_rol_menus_path
  end
end
