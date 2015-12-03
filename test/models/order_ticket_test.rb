require 'test_helper'

class OrderTicketTest < ActiveSupport::TestCase
  def valid_attributes
    {
      travellers: 2,
      price: 1001
    }
  end

  test "a valid ordered trip can be created" do
    ordered_trip = OrderedTrip.new(valid_attributes)
    assert ordered_trip.valid?
  end

  test "it can't have a negative number of travellers" do
    ordered_trip = OrderedTrip.new(travellers: -1,
                                   price: 100)
    refute ordered_trip.valid?
  end
end
