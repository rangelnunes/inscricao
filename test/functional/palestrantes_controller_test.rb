require 'test_helper'

class PalestrantesControllerTest < ActionController::TestCase
  setup do
    @palestrante = palestrantes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:palestrantes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create palestrante" do
    assert_difference('Palestrante.count') do
      post :create, palestrante: { institution: @palestrante.institution, lattes: @palestrante.lattes, name: @palestrante.name }
    end

    assert_redirected_to palestrante_path(assigns(:palestrante))
  end

  test "should show palestrante" do
    get :show, id: @palestrante
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @palestrante
    assert_response :success
  end

  test "should update palestrante" do
    put :update, id: @palestrante, palestrante: { institution: @palestrante.institution, lattes: @palestrante.lattes, name: @palestrante.name }
    assert_redirected_to palestrante_path(assigns(:palestrante))
  end

  test "should destroy palestrante" do
    assert_difference('Palestrante.count', -1) do
      delete :destroy, id: @palestrante
    end

    assert_redirected_to palestrantes_path
  end
end
