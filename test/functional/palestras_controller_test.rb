require 'test_helper'

class PalestrasControllerTest < ActionController::TestCase
  setup do
    @palestra = palestras(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:palestras)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create palestra" do
    assert_difference('Palestra.count') do
      post :create, palestra: { data: @palestra.data, hora: @palestra.hora, title: @palestra.title }
    end

    assert_redirected_to palestra_path(assigns(:palestra))
  end

  test "should show palestra" do
    get :show, id: @palestra
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @palestra
    assert_response :success
  end

  test "should update palestra" do
    put :update, id: @palestra, palestra: { data: @palestra.data, hora: @palestra.hora, title: @palestra.title }
    assert_redirected_to palestra_path(assigns(:palestra))
  end

  test "should destroy palestra" do
    assert_difference('Palestra.count', -1) do
      delete :destroy, id: @palestra
    end

    assert_redirected_to palestras_path
  end
end
