require 'test_helper'

class MesasredondasControllerTest < ActionController::TestCase
  setup do
    @mesasredonda = mesasredondas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mesasredondas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mesasredonda" do
    assert_difference('Mesasredonda.count') do
      post :create, mesasredonda: { data: @mesasredonda.data, title: @mesasredonda.title }
    end

    assert_redirected_to mesasredonda_path(assigns(:mesasredonda))
  end

  test "should show mesasredonda" do
    get :show, id: @mesasredonda
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mesasredonda
    assert_response :success
  end

  test "should update mesasredonda" do
    put :update, id: @mesasredonda, mesasredonda: { data: @mesasredonda.data, title: @mesasredonda.title }
    assert_redirected_to mesasredonda_path(assigns(:mesasredonda))
  end

  test "should destroy mesasredonda" do
    assert_difference('Mesasredonda.count', -1) do
      delete :destroy, id: @mesasredonda
    end

    assert_redirected_to mesasredondas_path
  end
end
