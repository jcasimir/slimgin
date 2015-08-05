require_relative 'test_helper'
require_relative '../lib/sales_engine'
require_relative '../lib/customer'


class CustomerTest < Minitest::Test
  attr_reader :engine

  def setup
    @engine = SalesEngine.new("./test/fixtures")
    engine.startup
  end

  def test_it_can_find_its_invoices
    repo = engine.customer_repository
    customer = repo.id(1)

    invoices = customer.invoices

    assert_equal 8, invoices.size
  end

  def test_returns_associated_transactions
    repo = engine.customer_repository
    customer = repo.id(1)

    transactions = customer.transactions

    assert_equal 9, transactions.size
  end

  def test_returns_favorite_merchant
    repo = engine.customer_repository
    customer = repo.id(1)

    merchant = customer.favorite_merchant

    assert_equal "Schroeder-Jerde", merchant.name
  end


  ##########PREVIOUS DEVELOPER ############
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

    assert_equal "Ondricka", customer.last_name
  end

  def test_it_can_return_its_created_at_time_as_string
    customer = Customer.new(nil, first_name: "Joey", last_name: "Ondricka", created_at: "2015-03-27 14:15:09 UTC", updated_at: "2012-03-27 14:54:09 UTC")

    assert_equal "2015-03-27 14:15:09 UTC", customer.created_at.to_s
  end


  def test_it_can_return_its_updated_at_time_as_string
    customer = Customer.new(nil, first_name: "Joey", last_name: "Ondricka", created_at: "2015-03-27 14:15:09 UTC", updated_at: "2012-03-27 14:54:09 UTC")

    assert_equal "2012-03-27 14:54:09 UTC", customer.updated_at.to_s
  end

  def test_parse_leaves_a_normal_string_alone
    customer = Customer.new(nil, first_name: "Joey", last_name: "Ondricka", created_at: "2015-03-27 14:15:09 UTC", updated_at: "2012-03-27 14:54:09 UTC")

    parsed = customer.parse "hello world"

    assert_equal "hello world", parsed
  end

end
