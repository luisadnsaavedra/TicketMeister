require 'test_helper'

class ConcertsControllerTest < ActionController::TestCase

  include Devise::Test::ControllerHelpers
  
  setup do
    @concert = concerts(:one)
    @theater = theaters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:concerts)
  end

  test "should get new" do
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
  end

  test "should get edit" do
    get :edit, id: @concert
    assert_response :success
  end

  test "should update concert" do
    patch :update, id: @concert, concert: { theater_id: @theater, title: @concert.title }
    assert_redirected_to concert_path(assigns(:concert))
  end

  test "should destroy concert" do
    assert_difference('Concert.count', -1) do
      delete :destroy, id: @concert
    end

    assert_redirected_to concerts_path
  end
end
