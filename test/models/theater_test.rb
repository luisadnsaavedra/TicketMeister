require 'test_helper'

class TheaterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'should not save empty theater' do
    theater = Theater.new

    theater.save
    return theater.valid?
  end

  test 'should save a valid theater' do
    theater = Theater.new

    theater.title = 'New Theater'
    theater.description = 'This theater has a description'

    theater.save
    assert theater.valid?
  end

  test 'should not save duplicate theater title' do
    theater = Theater.new
    theater.title = 'Theater 1'
    theater.description = 'Description'

    theater.save
    assert theater.valid?

    theater2 = Theater.new
    theater2.title = 'Theater 1'
    theater2.description = 'Description'

    theater2.save
    refute theater2.valid?
  end
end
