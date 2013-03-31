require 'test_helper'

class Activo::ProveedorCisControllerTest < ActionController::TestCase
  setup do
    @activo_proveedor_ci = activo_proveedor_cis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:activo_proveedor_cis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create activo_proveedor_ci" do
    assert_difference('Activo::ProveedorCi.count') do
      post :create, activo_proveedor_ci: { direccion: @activo_proveedor_ci.direccion, fecha_fin_vigencia: @activo_proveedor_ci.fecha_fin_vigencia, fecha_inicio_vigencia: @activo_proveedor_ci.fecha_inicio_vigencia, nit: @activo_proveedor_ci.nit, nombre_comercial: @activo_proveedor_ci.nombre_comercial, pagina_web: @activo_proveedor_ci.pagina_web, sigla: @activo_proveedor_ci.sigla, telefono_celular: @activo_proveedor_ci.telefono_celular, telefono_convencional: @activo_proveedor_ci.telefono_convencional, telefono_fax: @activo_proveedor_ci.telefono_fax, tipo_proveedor_id: @activo_proveedor_ci.tipo_proveedor_id, url_logo: @activo_proveedor_ci.url_logo }
    end

    assert_redirected_to activo_proveedor_ci_path(assigns(:activo_proveedor_ci))
  end

  test "should show activo_proveedor_ci" do
    get :show, id: @activo_proveedor_ci
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @activo_proveedor_ci
    assert_response :success
  end

  test "should update activo_proveedor_ci" do
    put :update, id: @activo_proveedor_ci, activo_proveedor_ci: { direccion: @activo_proveedor_ci.direccion, fecha_fin_vigencia: @activo_proveedor_ci.fecha_fin_vigencia, fecha_inicio_vigencia: @activo_proveedor_ci.fecha_inicio_vigencia, nit: @activo_proveedor_ci.nit, nombre_comercial: @activo_proveedor_ci.nombre_comercial, pagina_web: @activo_proveedor_ci.pagina_web, sigla: @activo_proveedor_ci.sigla, telefono_celular: @activo_proveedor_ci.telefono_celular, telefono_convencional: @activo_proveedor_ci.telefono_convencional, telefono_fax: @activo_proveedor_ci.telefono_fax, tipo_proveedor_id: @activo_proveedor_ci.tipo_proveedor_id, url_logo: @activo_proveedor_ci.url_logo }
    assert_redirected_to activo_proveedor_ci_path(assigns(:activo_proveedor_ci))
  end

  test "should destroy activo_proveedor_ci" do
    assert_difference('Activo::ProveedorCi.count', -1) do
      delete :destroy, id: @activo_proveedor_ci
    end

    assert_redirected_to activo_proveedor_cis_path
  end
end
