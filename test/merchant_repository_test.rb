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
end
