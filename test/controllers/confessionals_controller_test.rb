require 'test_helper'

class ConfessionalsControllerTest < ActionController::TestCase
  setup do
    @confessional = confessionals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:confessionals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create confessional" do
    assert_difference('Confessional.count') do
      post :create, confessional: { confession: @confessional.confession, confessor: @confessional.confessor }
    end

    assert_redirected_to confessional_path(assigns(:confessional))
  end

  test "should show confessional" do
    get :show, id: @confessional
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @confessional
    assert_response :success
  end

  test "should update confessional" do
    patch :update, id: @confessional, confessional: { confession: @confessional.confession, confessor: @confessional.confessor }
    assert_redirected_to confessional_path(assigns(:confessional))
  end

  test "should destroy confessional" do
    assert_difference('Confessional.count', -1) do
      delete :destroy, id: @confessional
    end

    assert_redirected_to confessionals_path
  end
end
