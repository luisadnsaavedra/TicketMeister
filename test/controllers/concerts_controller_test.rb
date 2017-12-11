require 'test_helper'

class ConcertsControllerTest < ActionController::TestCase

  include Devise::Test::ControllerHelpers

  setup do
    @concert = concerts(:one)
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
    assert_not_nil assigns(:concerts)

    assert_template layout: 'application'

    assert_select 'title', 'TicketMeister'
    assert_select 'h1', 'Listing Concerts'
    assert_select 'p', 'More concerts can be added in a specific theater'
  end

  test "user should not get new" do
    get :new, theater_id: @theater
    assert_redirected_to concerts_path
  end

  test "admin should get new" do
    sign_in @admin_user
    get :new, theater_id: @theater
    assert_response :success
  end

  test "should create concert" do
    assert_difference('Concert.count') do
      post :create, concert: { theater_id: @theater, title: @concert.title }
    end

    assert_redirected_to concert_path(assigns(:concert))
  end

  test "should show concert" do
    get :show, id: @concert
    assert_response :success

    assert_select 'title', 'TicketMeister'
    assert_select 'h1', @concert.title
    assert_select 'h2', 'Seat Map'
    assert_select 'h1', 'Stage'

  end

  test "user should not get edit" do
    get :edit, id: @concert
    assert_response :redirect
    assert_redirected_to concerts_path
  end

  test "user should not update concert" do
    patch :update, id: @concert, concert: { theater_id: @theater, title: @concert.title }
    assert_redirected_to concerts_path
  end

  test "user should not destroy concert" do
    assert_difference('Concert.count', 0) do
      delete :destroy, id: @concert
    end

    assert_redirected_to concerts_path
  end

  #Test functionality of the app for admin
  test "admin should get edit" do
    #Sign in as the admin
    sign_in @admin_user

    get :edit, id: @concert
    assert_response :success
  end

  test "admin should update concert" do
    sign_in @admin_user
    patch :update, id: @concert, concert: { theater_id: @theater, title: @concert.title }
    assert_redirected_to concert_path(assigns(:concert))
  end

  test "admin should destroy concert" do
    sign_in @admin_user
    assert_difference('Concert.count', -1) do
      delete :destroy, id: @concert
    end

    assert_redirected_to concerts_path
  end
end
