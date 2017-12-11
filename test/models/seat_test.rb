require 'test_helper'

class SeatTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'should not save empty seat' do
    seat = Seat.new

    seat.save
    return seat.valid?
  end

  test 'should save a valid seat' do
    seat = Seat.new

    seat.row = 'A'
    seat.concert = concerts(:one)
    seat.number = 12
    seat.price = 10

    seat.save
    assert seat.valid?
  end

  test 'should not save invalid seats' do
    seat = Seat.new
    seat.row = 'AB'
    seat.concert = concerts(:one)
    seat.number = 12
    seat.price = 10

    seat.save
    refute seat.valid?

    seat2 = Seat.new
    seat2.row = 'A'
    seat2.concert = concerts(:one)
    seat2.number = 35
    seat2.price = 10


    seat2.save
    refute seat2.valid?

    seat3 = Seat.new
    seat3.row = 'A'
    seat3.concert = concerts(:one)
    seat3.number = 13
    seat3.price = -1


    seat3.save
    refute seat3.valid?
  end
end
