require_relative 'test_helper'
require_relative '../lib/item'
require_relative '../lib/sales_engine'

class ItemTest < Minitest::Test
  attr_reader :engine

  def setup
    @engine = SalesEngine.new("./test/fixtures")
    engine.startup
  end

  def test_it_initializes_an_item
    item = Item.new(nil, name: "cake", unit_price: 123)
    assert_equal "cake", item.name
  end

  def test_it_can_find_its_invoice_items
    repo = engine.item_repository
    item = repo.id(539)

    invoice_items = item.invoice_items

    assert_equal 1, invoice_items.size
  end

  def test_it_can_find_its_merchant
    repo = engine.item_repository
    item = repo.id(539)

    merchant = item.merchant

    assert_equal "Klein, Rempel and Jones", merchant.name
  end


end
