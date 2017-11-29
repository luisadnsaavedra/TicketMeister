require 'test_helper'

class ConcertTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @theater = theaters(:one)
  end

  test 'should not save empty concert' do
    concert = Concert.new

    concert.save
    refute concert.valid?
  end

  test 'should save valid concert' do
    concert = Concert.new

    concert.title = 'Concert Title'
    concert.theater = @theater

    concert.save
    assert concert.valid?
  end

end
