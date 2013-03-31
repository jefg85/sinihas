require 'test_helper'

class Activo::FabricadorCategoriaCisControllerTest < ActionController::TestCase
  setup do
    @activo_fabricador_categoria_ci = activo_fabricador_categoria_cis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:activo_fabricador_categoria_cis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create activo_fabricador_categoria_ci" do
    assert_difference('Activo::FabricadorCategoriaCi.count') do
      post :create, activo_fabricador_categoria_ci: { categoria_ci_id: @activo_fabricador_categoria_ci.categoria_ci_id, estado_id: @activo_fabricador_categoria_ci.estado_id, fabricador_ci_id: @activo_fabricador_categoria_ci.fabricador_ci_id }
    end

    assert_redirected_to activo_fabricador_categoria_ci_path(assigns(:activo_fabricador_categoria_ci))
  end

  test "should show activo_fabricador_categoria_ci" do
    get :show, id: @activo_fabricador_categoria_ci
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @activo_fabricador_categoria_ci
    assert_response :success
  end

  test "should update activo_fabricador_categoria_ci" do
    put :update, id: @activo_fabricador_categoria_ci, activo_fabricador_categoria_ci: { categoria_ci_id: @activo_fabricador_categoria_ci.categoria_ci_id, estado_id: @activo_fabricador_categoria_ci.estado_id, fabricador_ci_id: @activo_fabricador_categoria_ci.fabricador_ci_id }
    assert_redirected_to activo_fabricador_categoria_ci_path(assigns(:activo_fabricador_categoria_ci))
  end

  test "should destroy activo_fabricador_categoria_ci" do
    assert_difference('Activo::FabricadorCategoriaCi.count', -1) do
      delete :destroy, id: @activo_fabricador_categoria_ci
    end

    assert_redirected_to activo_fabricador_categoria_cis_path
  end
end
