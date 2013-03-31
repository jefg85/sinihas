require 'test_helper'

class Catalogo::TipoCatalogosControllerTest < ActionController::TestCase
  setup do
    @catalogo_tipo_catalogo = catalogo_tipo_catalogos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:catalogo_tipo_catalogos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create catalogo_tipo_catalogo" do
    assert_difference('Catalogo::TipoCatalogo.count') do
      post :create, catalogo_tipo_catalogo: { activo: @catalogo_tipo_catalogo.activo, codigo: @catalogo_tipo_catalogo.codigo, descripcion: @catalogo_tipo_catalogo.descripcion, nombre: @catalogo_tipo_catalogo.nombre }
    end

    assert_redirected_to catalogo_tipo_catalogo_path(assigns(:catalogo_tipo_catalogo))
  end

  test "should show catalogo_tipo_catalogo" do
    get :show, id: @catalogo_tipo_catalogo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @catalogo_tipo_catalogo
    assert_response :success
  end

  test "should update catalogo_tipo_catalogo" do
    put :update, id: @catalogo_tipo_catalogo, catalogo_tipo_catalogo: { activo: @catalogo_tipo_catalogo.activo, codigo: @catalogo_tipo_catalogo.codigo, descripcion: @catalogo_tipo_catalogo.descripcion, nombre: @catalogo_tipo_catalogo.nombre }
    assert_redirected_to catalogo_tipo_catalogo_path(assigns(:catalogo_tipo_catalogo))
  end

  test "should destroy catalogo_tipo_catalogo" do
    assert_difference('Catalogo::TipoCatalogo.count', -1) do
      delete :destroy, id: @catalogo_tipo_catalogo
    end

    assert_redirected_to catalogo_tipo_catalogos_path
  end
end
