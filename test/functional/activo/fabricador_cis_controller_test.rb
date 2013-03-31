require 'test_helper'

class Activo::FabricadorCisControllerTest < ActionController::TestCase
  setup do
    @activo_fabricador_ci = activo_fabricador_cis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:activo_fabricador_cis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create activo_fabricador_ci" do
    assert_difference('Activo::FabricadorCi.count') do
      post :create, activo_fabricador_ci: { fecha_fin_vigencia: @activo_fabricador_ci.fecha_fin_vigencia, fecha_inicio_vigencia: @activo_fabricador_ci.fecha_inicio_vigencia, nombre_comercial: @activo_fabricador_ci.nombre_comercial, pagina_web: @activo_fabricador_ci.pagina_web, url_logo: @activo_fabricador_ci.url_logo }
    end

    assert_redirected_to activo_fabricador_ci_path(assigns(:activo_fabricador_ci))
  end

  test "should show activo_fabricador_ci" do
    get :show, id: @activo_fabricador_ci
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @activo_fabricador_ci
    assert_response :success
  end

  test "should update activo_fabricador_ci" do
    put :update, id: @activo_fabricador_ci, activo_fabricador_ci: { fecha_fin_vigencia: @activo_fabricador_ci.fecha_fin_vigencia, fecha_inicio_vigencia: @activo_fabricador_ci.fecha_inicio_vigencia, nombre_comercial: @activo_fabricador_ci.nombre_comercial, pagina_web: @activo_fabricador_ci.pagina_web, url_logo: @activo_fabricador_ci.url_logo }
    assert_redirected_to activo_fabricador_ci_path(assigns(:activo_fabricador_ci))
  end

  test "should destroy activo_fabricador_ci" do
    assert_difference('Activo::FabricadorCi.count', -1) do
      delete :destroy, id: @activo_fabricador_ci
    end

    assert_redirected_to activo_fabricador_cis_path
  end
end
