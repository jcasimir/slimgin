require_relative 'test_helper'
require_relative '../lib/merchant'

class MerchantTest < Minitest::Test
  def test_it_knows_what_name_it_has
    merchant = Merchant.new nil, name: "Alice"

    assert_equal "Alice", merchant.name
  end
end
