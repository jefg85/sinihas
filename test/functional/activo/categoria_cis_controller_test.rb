require 'test_helper'

class Activo::CategoriaCisControllerTest < ActionController::TestCase
  setup do
    @activo_categoria_ci = activo_categoria_cis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:activo_categoria_cis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create activo_categoria_ci" do
    assert_difference('Activo::CategoriaCi.count') do
      post :create, activo_categoria_ci: { descripcion_corta: @activo_categoria_ci.descripcion_corta, descripcion_larga: @activo_categoria_ci.descripcion_larga, fecha_fin_vigencia: @activo_categoria_ci.fecha_fin_vigencia, fecha_inicio_vigencia: @activo_categoria_ci.fecha_inicio_vigencia, nivel_i_id: @activo_categoria_ci.nivel_i_id, nivel_ii_id: @activo_categoria_ci.nivel_ii_id, nivel_iii_id: @activo_categoria_ci.nivel_iii_id, posicion: @activo_categoria_ci.posicion, prefijo_nombramiento: @activo_categoria_ci.prefijo_nombramiento, url_imagen: @activo_categoria_ci.url_imagen }
    end

    assert_redirected_to activo_categoria_ci_path(assigns(:activo_categoria_ci))
  end

  test "should show activo_categoria_ci" do
    get :show, id: @activo_categoria_ci
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @activo_categoria_ci
    assert_response :success
  end

  test "should update activo_categoria_ci" do
    put :update, id: @activo_categoria_ci, activo_categoria_ci: { descripcion_corta: @activo_categoria_ci.descripcion_corta, descripcion_larga: @activo_categoria_ci.descripcion_larga, fecha_fin_vigencia: @activo_categoria_ci.fecha_fin_vigencia, fecha_inicio_vigencia: @activo_categoria_ci.fecha_inicio_vigencia, nivel_i_id: @activo_categoria_ci.nivel_i_id, nivel_ii_id: @activo_categoria_ci.nivel_ii_id, nivel_iii_id: @activo_categoria_ci.nivel_iii_id, posicion: @activo_categoria_ci.posicion, prefijo_nombramiento: @activo_categoria_ci.prefijo_nombramiento, url_imagen: @activo_categoria_ci.url_imagen }
    assert_redirected_to activo_categoria_ci_path(assigns(:activo_categoria_ci))
  end

  test "should destroy activo_categoria_ci" do
    assert_difference('Activo::CategoriaCi.count', -1) do
      delete :destroy, id: @activo_categoria_ci
    end

    assert_redirected_to activo_categoria_cis_path
  end
end
