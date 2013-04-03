require 'test_helper'

class MinicursosControllerTest < ActionController::TestCase
  setup do
    @minicurso = minicursos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:minicursos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create minicurso" do
    assert_difference('Minicurso.count') do
      post :create, minicurso: { date_fim: @minicurso.date_fim, date_ini: @minicurso.date_ini, title: @minicurso.title, vacancies: @minicurso.vacancies }
    end

    assert_redirected_to minicurso_path(assigns(:minicurso))
  end

  test "should show minicurso" do
    get :show, id: @minicurso
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @minicurso
    assert_response :success
  end

  test "should update minicurso" do
    put :update, id: @minicurso, minicurso: { date_fim: @minicurso.date_fim, date_ini: @minicurso.date_ini, title: @minicurso.title, vacancies: @minicurso.vacancies }
    assert_redirected_to minicurso_path(assigns(:minicurso))
  end

  test "should destroy minicurso" do
    assert_difference('Minicurso.count', -1) do
      delete :destroy, id: @minicurso
    end

    assert_redirected_to minicursos_path
  end
end
