require 'test_helper'

class SprintstoriesControllerTest < ActionController::TestCase
  setup do
    @sprintstory = sprintstories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sprintstories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sprintstory" do
    assert_difference('Sprintstory.count') do
      post :create, sprintstory: @sprintstory.attributes
    end

    assert_redirected_to sprintstory_path(assigns(:sprintstory))
  end

  test "should show sprintstory" do
    get :show, id: @sprintstory
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sprintstory
    assert_response :success
  end

  test "should update sprintstory" do
    put :update, id: @sprintstory, sprintstory: @sprintstory.attributes
    assert_redirected_to sprintstory_path(assigns(:sprintstory))
  end

  test "should destroy sprintstory" do
    assert_difference('Sprintstory.count', -1) do
      delete :destroy, id: @sprintstory
    end

    assert_redirected_to sprintstories_path
  end
end
