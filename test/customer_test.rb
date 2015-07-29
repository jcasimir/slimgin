require_relative 'test_helper'
require_relative '../lib/customer'

class CustomerTest < Minitest::Test
  def test_it_can_be_created_with_parameters
    customer = Customer.new(nil, first_name: "Joey", last_name: "Ondricka", created_at: "2015-03-27 14:15:09 UTC", updated_at: "2012-03-27 14:54:09 UTC")

    assert customer
  end

  def test_it_can_return_its_first_name
    customer = Customer.new(nil, first_name: "Joey", last_name: "Ondricka", created_at: "2015-03-27 14:15:09 UTC", updated_at: "2012-03-27 14:54:09 UTC")

    assert_equal customer.first_name, "Joey"
  end

  def test_it_can_return_its_last_name
    customer = Customer.new(nil, first_name: "Joey", last_name: "Ondricka", created_at: "2015-03-27 14:15:09 UTC", updated_at: "2012-03-27 14:54:09 UTC")

    assert_equal customer.last_name, "Ondricka"
  end

  def test_it_can_return_its_created_at_time_as_timestamp
    customer = Customer.new(nil, first_name: "Joey", last_name: "Ondricka", created_at: "2015-03-27 14:15:09 UTC", updated_at: "2012-03-27 14:54:09 UTC")

    assert_kind_of Time, customer.created_at
  end

  def test_it_can_return_its_created_at_time_as_string
    customer = Customer.new(nil, first_name: "Joey", last_name: "Ondricka", created_at: "2015-03-27 14:15:09 UTC", updated_at: "2012-03-27 14:54:09 UTC")

    assert_equal customer.created_at.to_s, "2015-03-27 14:15:09 UTC"
  end

  def test_it_can_return_its_updated_at_time_as_timestamp
    customer = Customer.new(nil, first_name: "Joey", last_name: "Ondricka", created_at: "2015-03-27 14:15:09 UTC", updated_at: "2012-03-27 14:54:09 UTC")

    assert_kind_of Time, customer.updated_at
  end

  def test_it_can_return_its_updated_at_time_as_string
    customer = Customer.new(nil, first_name: "Joey", last_name: "Ondricka", created_at: "2015-03-27 14:15:09 UTC", updated_at: "2012-03-27 14:54:09 UTC")

    assert_equal customer.updated_at.to_s, "2012-03-27 14:54:09 UTC"
  end

  def test_parse_leaves_a_normal_string_alone
    customer = Customer.new(nil, first_name: "Joey", last_name: "Ondricka", created_at: "2015-03-27 14:15:09 UTC", updated_at: "2012-03-27 14:54:09 UTC")

    parsed = customer.parse "hello world"

    assert_equal parsed, "hello world"
  end

  def test_parse_turns_a_date_string_into_date_class
    customer = Customer.new(nil, first_name: "Joey", last_name: "Ondricka", created_at: "2015-03-27 14:15:09 UTC", updated_at: "2012-03-27 14:54:09 UTC")
    
    parsed = customer.parse "2015-03-07 14:15:09 UTC"

    assert_kind_of Time, parsed
  end
end
