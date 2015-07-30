require_relative 'test_helper'
require_relative '../lib/merchant_repository'

class MerchantRepositoryTest < Minitest::Test
  def test_it_is_a_repository
    merchant_repo = MerchantRepository.new nil, "./fixtures/merchants_head.csv"

    assert_kind_of Repository, merchant_repo
  end
end
