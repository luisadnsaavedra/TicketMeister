require 'test_helper'

class ConcertTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'should not save empty concert' do
    concert = Concert.new

    concert.save
    return concert.valid?
  end

  test 'should save a valid concert' do
    concert = Concert.new

    concert.title = 'New Concert'
    concert.description = 'This concert has a description'

    concert.save
    assert concert.valid?
  end

  test 'should not save duplicate concert title' do
    concert = Concert.new
    concert.title = 'Concert 1'
    concert.description = 'Description'

    concert.save
    assert concert.valid?

    concert2 = Concert.new
    concert2.title = 'Concert 1'
    concert2.description = 'Description'

    concert2.save
    refute concert2.valid?
  end
  
end
