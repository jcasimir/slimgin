require_relative 'test_helper'
require_relative '../lib/sales_engine'
require_relative '../lib/item_repository'

class ItemRepositoryTest < Minitest::Test
  def test_initializes_an_item_repository
    repo = ItemRepository.new(nil, "./test/fixtures/items.csv")
    assert_equal "Item Qui Esse", repo.database['1'].name
  end
end
