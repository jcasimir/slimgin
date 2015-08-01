require_relative 'test_helper'
require_relative '../lib/merchant_repository'

class MerchantRepositoryTest < Minitest::Test
  def test_it_is_a_repository
    merchant_repo = MerchantRepository.new nil, "./test/fixtures/merchants.csv"

    assert_kind_of Repository, merchant_repo
  end

  def test_it_contains_merchants
    merchant_repo = MerchantRepository.new nil, "./test/fixtures/merchants.csv"

    assert_kind_of Merchant, merchant_repo.id("1")
  end

  def test_it_tells_the_engine_to_find_invoices
    skip
    engine = SalesEngine.new
    engine.startup
    repo = engine.merchant_repository
    result = repo.invoices_for_a_merchant("1")
    assert result
  end
end
