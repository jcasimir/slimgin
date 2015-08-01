require_relative 'test_helper'
require_relative '../lib/merchant'
require_relative '../lib/sales_engine'

class MerchantTest < Minitest::Test
  def test_it_knows_what_name_it_has
    merchant = Merchant.new nil, name: "Alice"

    assert_equal "Alice", merchant.name
  end

  def test_it_tells_the_repo_to_find_invoices_for_a_merchant
    skip
    engine = SalesEngine.new
    engine.startup
    repo = engine.merchant_repository
    merchant = repo.id("1")
    assert merchant.invoices
  end

  def test_it_can_find_invoices
    engine = SalesEngine.new
    engine.startup
    repo = engine.merchant_repository
    merchant = repo.id("1")
    result = merchant.invoices

    assert_equal 3, result.size
  end

  def test_it_can_find_items
    engine = SalesEngine.new
    engine.startup
    repo = engine.merchant_repository
    merchant = repo.id("1")
    result = merchant.items

    assert_equal 15, result.size
  end

end
