require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success

    assert_template layout: 'application'

    assert_select 'title', 'TicketMeister'
    assert_select 'h1', 'TicketMeister'
    assert_select 'p', 'Here you can find and purchase tickets to all the music related events happening near you.'
  end

  test "should get contact" do
    get :contact
    assert_response :success

    assert_template layout: 'application'

    assert_select 'title', 'TicketMeister'
    assert_select 'h1', 'Contact Us'
    assert_select 'p', 'Complete the following form to get in touch with us.'
  end

end
