require_relative 'test_helper'
require_relative '../lib/customer'

class CustomerTest < Minitest::Test
  def test_it_can_be_created_with_parameters
    customer = Customer.new("1", "Joey", "Ondricka", "2015-03-27 14:15:09 UTC", "2012-03-27 14:54:09 UTC")

    assert customer
  end

  def test_it_can_return_its_own_id
    customer = Customer.new("1", "Joey", "Ondricka", "2015-03-27 14:15:09 UTC", "2012-03-27 14:54:09 UTC")

    assert_equal customer.id, 1
  end

  def test_it_can_return_its_first_name
    customer = Customer.new("1", "Joey", "Ondricka", "2015-03-27 14:15:09 UTC", "2012-03-27 14:54:09 UTC")

    assert_equal customer.first_name, "Joey"
  end

  def test_it_can_return_its_last_name
    customer = Customer.new("1", "Joey", "Ondricka", "2015-03-27 14:15:09 UTC", "2012-03-27 14:54:09 UTC")

    assert_equal customer.last_name, "Ondricka"
  end

  def test_it_can_return_its_created_at_time_as_timestamp
    customer = Customer.new("1", "Joey", "Ondricka", "2015-03-27 14:15:09 UTC", "2012-03-27 14:54:09 UTC")

    assert_equal customer.created_at.class, Time
  end

  def test_it_can_return_its_created_at_time_as_string
    customer = Customer.new("1", "Joey", "Ondricka", "2015-03-27 14:15:09 UTC", "2012-03-27 14:54:09 UTC")

    assert_equal customer.created_at.to_s, "2015-03-27 14:15:09 UTC"
  end
end
