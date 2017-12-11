require 'test_helper'

class TicketTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
    @ticket = tickets(:one)
    # @ticket2 = tickets2(:one)
  end

  test 'should not save empty ticket' do
    ticket = Ticket.new

    ticket.save
    refute ticket.valid?
  end

  test 'should save valid ticket' do
    @ticket.save
    assert @ticket.valid?
  end

end
