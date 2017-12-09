require 'test_helper'

class ConcertTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @theater = theaters(:one)
    @concert = concerts(:one)
  end

  test 'should not save empty concert' do
    concert = Concert.new

    concert.save
    refute concert.valid?
  end

  test 'should save valid concert' do
    @concert.save
    assert @concert.valid?
  end

  test 'should save duplicate concert title' do
    concert1 = concerts(:one)
    concert2 = concerts(:one)

    concert1.save
    assert concert1.valid?

    concert2.save
    assert concert2.valid?
  end
end
