require 'test_helper'

class SeatsControllerTest < ActionController::TestCase

  include Devise::Test::ControllerHelpers
  include Capybara::DSL

  setup do
    @seat = seats(:one)
    @concert = concerts(:one)
    #seat view requires a logged in user
    @user = users(:admin)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success

    assert_template layout: 'application'

    assert_select 'title', 'TicketMeister'
    assert_select 'h1', 'Listing Booked Seats'
    assert_select 'p', 'Visit the "My Tickets" section to view the seats you have booked.'
    assert_select 'th', 'Concert'
    assert_select 'th', 'Theater'
    assert_select 'th', 'Row'
    assert_select 'th', 'Number'
    assert_select 'th', 'Price'
    assert_not_nil assigns(:seats)
  end

  test "should get new" do
    get :new, concert_id: @concert
    assert_response :success

    assert_template layout: 'application'

    assert_select 'title', 'TicketMeister'
    assert_select 'h1', 'Buy Ticket'
    assert_select 'label', 'Concert'
    assert_select 'p', "#{@concert.title} in #{@concert.theater.title}."
    assert_select 'label', 'Row'
    assert_select 'label', 'Number'
    assert_select 'label', 'Price'
  end

  # test "should create seat" do
  #   assert_difference('Seat.count') do
  #     # Requires a change due to way the form now operates
  #     #  post :create, seat: { concert_id: @seat.concert.id, number: @seat.number, price: @seat.price, row: @seat.row }
  #
  #     #Using the Capybara gem:
  #     visit '/concerts'
  #     click_on 'Show'
  #     #visit(new_seat_path(concert_id: @seat.concert.id, row: 'A', number: 1, price: 15))
  #     click_on('submit')#Capybara can't find 'Confirm' button in the form, which makes this test fail
  #   end
  #
  #   assert_redirected_to ticket_path(assigns(:ticket))
  # end
  #
  # test "should create ticket" do
  #   assert_difference('Ticket.count') do
  #     # post :create, seat: { concert_id: @seat.concert.id, row: @seat.row, number: @seat.number, price: @seat.price }
  #     first(:link, 1).click
  #     visit(new_seat_path(concert_id: @seat.concert.id, row: 'A', number: 1, price: 15))
  #     click_on('Confirm')
  #   end
  #
  #   assert_redirected_to ticket_path(assigns(:ticket))
  # end

  test "should show seat" do
    get :show, id: @seat
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @seat
    assert_response :success
  end

  test "should update seat" do
    patch :update, id: @seat, seat: { concert_id: @concert, number: @seat.number, price: @seat.price, row: @seat.row }
    assert_redirected_to seat_path(assigns(:seat))
  end

  test "should destroy seat" do
    assert_difference('Seat.count', -1) do
      delete :destroy, id: @seat
    end
    assert_redirected_to seats_path
  end

end
