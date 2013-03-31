require 'test_helper'

class Catalogo::CatalogosControllerTest < ActionController::TestCase
  setup do
    @catalogo_catalogo = catalogo_catalogos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:catalogo_catalogos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create catalogo_catalogo" do
    assert_difference('Catalogo::Catalogo.count') do
      post :create, catalogo_catalogo: { activo: @catalogo_catalogo.activo, descripcion: @catalogo_catalogo.descripcion, nombre: @catalogo_catalogo.nombre, orden: @catalogo_catalogo.orden, tipo_catalogo_id: @catalogo_catalogo.tipo_catalogo_id }
    end

    assert_redirected_to catalogo_catalogo_path(assigns(:catalogo_catalogo))
  end

  test "should show catalogo_catalogo" do
    get :show, id: @catalogo_catalogo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @catalogo_catalogo
    assert_response :success
  end

  test "should update catalogo_catalogo" do
    put :update, id: @catalogo_catalogo, catalogo_catalogo: { activo: @catalogo_catalogo.activo, descripcion: @catalogo_catalogo.descripcion, nombre: @catalogo_catalogo.nombre, orden: @catalogo_catalogo.orden, tipo_catalogo_id: @catalogo_catalogo.tipo_catalogo_id }
    assert_redirected_to catalogo_catalogo_path(assigns(:catalogo_catalogo))
  end

  test "should destroy catalogo_catalogo" do
    assert_difference('Catalogo::Catalogo.count', -1) do
      delete :destroy, id: @catalogo_catalogo
    end

    assert_redirected_to catalogo_catalogos_path
  end
end
