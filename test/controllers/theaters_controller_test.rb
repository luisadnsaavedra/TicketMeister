require 'test_helper'

class TheatersControllerTest < ActionController::TestCase

  include Devise::Test::ControllerHelpers

  setup do
    @theater = theaters(:one)
    #set up user and admin user
    @user = users(:one)
    @admin_user = users(:admin)
    #set user to normal user
    sign_in @user
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

  test "user should not get edit" do
    get :edit, id: @theater
    assert_response :redirect
    assert_redirected_to theaters_path #must be an admin to edit theater
  end

  test "user should not update theater" do
    patch :update, id: @theater, theater: { description: @theater.description, title: @theater.title }
    assert_redirected_to theaters_path #(assigns(:theater))
  end

  test "user should not destroy theater" do
    assert_difference('Theater.count', 0) do
      delete :destroy, id: @theater
    end

    assert_redirected_to theaters_path
  end

  #Test functionality of the app for the administrator user
  test "admin should get edit" do
    #Sign in as the admin
    sign_in @admin_user

    get :edit, id: @theater
    assert_response :success
  end

  test "admin should update theater" do
    sign_in @admin_user
    patch :update, id: @theater, theater: { description: @theater.description, title: @theater.title }
    assert_redirected_to theater_path(assigns(:theater))
  end

  test "admin should destroy theater" do
    sign_in @admin_user
    assert_difference('Theater.count', -1) do
      delete :destroy, id: @theater
    end

    assert_redirected_to theaters_path
  end
end
