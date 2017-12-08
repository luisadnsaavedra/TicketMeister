require 'test_helper'

class TheatersControllerTest < ActionController::TestCase

  include Devise::Test::ControllerHelpers

  setup do
    @theater = theaters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:theaters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create theater" do
    assert_difference('Theater.count') do
      post :create, theater: { description: @theater.description, title: @theater.title + " create" }
    end

    assert_redirected_to theater_path(assigns(:theater))
  end

  test "should show theater" do
    get :show, id: @theater
    assert_response :success
  end

  test "should not get edit" do
    get :edit, id: @theater
    assert_response :redirect
    assert_redirected_to theaters_path #must be an admin to edit theater
  end

  test "should not update theater" do
    patch :update, id: @theater, theater: { description: @theater.description, title: @theater.title }
    assert_redirected_to theaters_path #(assigns(:theater))
  end

  test "should not destroy theater" do
    assert_difference('Theater.count', 0) do
      delete :destroy, id: @theater
    end

    assert_redirected_to theaters_path
  end

  #test "should destroy theater", test "should update theater", test "should get edit"
end
