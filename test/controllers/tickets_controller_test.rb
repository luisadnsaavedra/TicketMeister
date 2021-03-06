require 'test_helper'

class TicketsControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers
  include Capybara::DSL

  setup do
    @ticket = tickets(:one)
    #tickets require a logged in user (admin for some of the options)
    @user = users(:admin)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tickets)

    assert_template layout: 'application'

    assert_select 'title', 'TicketMeister'
    assert_select 'h1', 'Listing Tickets'
    assert_select 'th', 'Concert'
    assert_select 'th', 'Theater'
    assert_select 'th', 'Row'
    assert_select 'th', 'Number'
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ticket" do
    assert_difference('Ticket.count') do
      post :create, ticket: { seat_id: @ticket.seat_id, user_id: @ticket.user_id }
    end

    assert_redirected_to ticket_path(assigns(:ticket))
  end

  test "should show ticket" do
    get :show, id: @ticket
    assert_response :success

    assert_template layout: 'application'

    assert_select 'title', 'TicketMeister'
    assert_select 'p', "User:\n#{@ticket.user.email}"
    assert_select 'p', "Concert:\n#{@ticket.seat.concert.title} in #{@ticket.seat.concert.theater.title}"
    assert_select 'p', "#{@ticket.seat.concert.theater.title}:\n#{@ticket.seat.concert.theater.description}"
    assert_select 'p', "Seat:\n#{@ticket.seat.row}#{@ticket.seat.number}"
    assert_select 'p', "Price:\n£#{@ticket.seat.price}"
    assert_select 'a', 'Back'
  end

  test "should get edit" do
    get :edit, id: @ticket
    assert_response :success
  end

  test "should update ticket" do
    patch :update, id: @ticket, ticket: { seat_id: @ticket.seat_id, user_id: @ticket.user_id }
    assert_redirected_to ticket_path(assigns(:ticket))
  end

  test "should destroy ticket" do
    assert_difference('Ticket.count', -1) do
      delete :destroy, id: @ticket
    end

    assert_redirected_to tickets_path
  end

end
