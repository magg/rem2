require 'test_helper'

class CriteriosControllerTest < ActionController::TestCase
  setup do
    @criterio = criterios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:criterios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create criterio" do
    assert_difference('Criterio.count') do
      post :create, criterio: @criterio.attributes
    end

    assert_redirected_to criterio_path(assigns(:criterio))
  end

  test "should show criterio" do
    get :show, id: @criterio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @criterio
    assert_response :success
  end

  test "should update criterio" do
    put :update, id: @criterio, criterio: @criterio.attributes
    assert_redirected_to criterio_path(assigns(:criterio))
  end

  test "should destroy criterio" do
    assert_difference('Criterio.count', -1) do
      delete :destroy, id: @criterio
    end

    assert_redirected_to criterios_path
  end
end
