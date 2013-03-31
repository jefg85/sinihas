require 'test_helper'

class Seguridad::MenusControllerTest < ActionController::TestCase
  setup do
    @seguridad_menu = seguridad_menus(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:seguridad_menus)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create seguridad_menu" do
    assert_difference('Seguridad::Menu.count') do
      post :create, seguridad_menu: { activo: @seguridad_menu.activo, menu_id: @seguridad_menu.menu_id, modulo_id: @seguridad_menu.modulo_id, nombre: @seguridad_menu.nombre, orden: @seguridad_menu.orden, recurso_id: @seguridad_menu.recurso_id }
    end

    assert_redirected_to seguridad_menu_path(assigns(:seguridad_menu))
  end

  test "should show seguridad_menu" do
    get :show, id: @seguridad_menu
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @seguridad_menu
    assert_response :success
  end

  test "should update seguridad_menu" do
    put :update, id: @seguridad_menu, seguridad_menu: { activo: @seguridad_menu.activo, menu_id: @seguridad_menu.menu_id, modulo_id: @seguridad_menu.modulo_id, nombre: @seguridad_menu.nombre, orden: @seguridad_menu.orden, recurso_id: @seguridad_menu.recurso_id }
    assert_redirected_to seguridad_menu_path(assigns(:seguridad_menu))
  end

  test "should destroy seguridad_menu" do
    assert_difference('Seguridad::Menu.count', -1) do
      delete :destroy, id: @seguridad_menu
    end

    assert_redirected_to seguridad_menus_path
  end
end
