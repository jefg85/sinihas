require 'test_helper'

class Incidente::TipoIncidenteCategoriaCisControllerTest < ActionController::TestCase
  setup do
    @incidente_tipo_incidente_categoria_ci = incidente_tipo_incidente_categoria_cis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:incidente_tipo_incidente_categoria_cis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create incidente_tipo_incidente_categoria_ci" do
    assert_difference('Incidente::TipoIncidenteCategoriaCi.count') do
      post :create, incidente_tipo_incidente_categoria_ci: { categoria_ci_id: @incidente_tipo_incidente_categoria_ci.categoria_ci_id, descripcion_corta: @incidente_tipo_incidente_categoria_ci.descripcion_corta, descripcion_larga: @incidente_tipo_incidente_categoria_ci.descripcion_larga, estado_id: @incidente_tipo_incidente_categoria_ci.estado_id }
    end

    assert_redirected_to incidente_tipo_incidente_categoria_ci_path(assigns(:incidente_tipo_incidente_categoria_ci))
  end

  test "should show incidente_tipo_incidente_categoria_ci" do
    get :show, id: @incidente_tipo_incidente_categoria_ci
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @incidente_tipo_incidente_categoria_ci
    assert_response :success
  end

  test "should update incidente_tipo_incidente_categoria_ci" do
    put :update, id: @incidente_tipo_incidente_categoria_ci, incidente_tipo_incidente_categoria_ci: { categoria_ci_id: @incidente_tipo_incidente_categoria_ci.categoria_ci_id, descripcion_corta: @incidente_tipo_incidente_categoria_ci.descripcion_corta, descripcion_larga: @incidente_tipo_incidente_categoria_ci.descripcion_larga, estado_id: @incidente_tipo_incidente_categoria_ci.estado_id }
    assert_redirected_to incidente_tipo_incidente_categoria_ci_path(assigns(:incidente_tipo_incidente_categoria_ci))
  end

  test "should destroy incidente_tipo_incidente_categoria_ci" do
    assert_difference('Incidente::TipoIncidenteCategoriaCi.count', -1) do
      delete :destroy, id: @incidente_tipo_incidente_categoria_ci
    end

    assert_redirected_to incidente_tipo_incidente_categoria_cis_path
  end
end
