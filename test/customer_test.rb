require_relative 'test_helper'
require_relative '../lib/customer'

class CustomerTest < Minitest::Test
  def test_it_can_be_created_with_parameters
    customer = Customer.new("1", "Joey", "Ondricka", "2015-03-27 14:15:09 UTC", "2012-03-27 14:54:09 UTC")

    assert customer
  end
end
