require 'test_helper'

class Activo::PropiedadEspecificaCisControllerTest < ActionController::TestCase
  setup do
    @activo_propiedad_especifica_ci = activo_propiedad_especifica_cis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:activo_propiedad_especifica_cis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create activo_propiedad_especifica_ci" do
    assert_difference('Activo::PropiedadEspecificaCi.count') do
      post :create, activo_propiedad_especifica_ci: { fecha_fin_vigencia: @activo_propiedad_especifica_ci.fecha_fin_vigencia, fecha_inicio_vigencia: @activo_propiedad_especifica_ci.fecha_inicio_vigencia, nombre_campo: @activo_propiedad_especifica_ci.nombre_campo, tipo_campo: @activo_propiedad_especifica_ci.tipo_campo, valor_string: @activo_propiedad_especifica_ci.valor_string, visualizar: @activo_propiedad_especifica_ci.visualizar }
    end

    assert_redirected_to activo_propiedad_especifica_ci_path(assigns(:activo_propiedad_especifica_ci))
  end

  test "should show activo_propiedad_especifica_ci" do
    get :show, id: @activo_propiedad_especifica_ci
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @activo_propiedad_especifica_ci
    assert_response :success
  end

  test "should update activo_propiedad_especifica_ci" do
    put :update, id: @activo_propiedad_especifica_ci, activo_propiedad_especifica_ci: { fecha_fin_vigencia: @activo_propiedad_especifica_ci.fecha_fin_vigencia, fecha_inicio_vigencia: @activo_propiedad_especifica_ci.fecha_inicio_vigencia, nombre_campo: @activo_propiedad_especifica_ci.nombre_campo, tipo_campo: @activo_propiedad_especifica_ci.tipo_campo, valor_string: @activo_propiedad_especifica_ci.valor_string, visualizar: @activo_propiedad_especifica_ci.visualizar }
    assert_redirected_to activo_propiedad_especifica_ci_path(assigns(:activo_propiedad_especifica_ci))
  end

  test "should destroy activo_propiedad_especifica_ci" do
    assert_difference('Activo::PropiedadEspecificaCi.count', -1) do
      delete :destroy, id: @activo_propiedad_especifica_ci
    end

    assert_redirected_to activo_propiedad_especifica_cis_path
  end
end
