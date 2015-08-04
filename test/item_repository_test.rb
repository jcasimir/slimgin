require_relative 'test_helper'
require_relative '../lib/sales_engine'
require_relative '../lib/item_repository'

class ItemRepositoryTest < Minitest::Test
  attr_reader :engine

  def setup
    @engine = SalesEngine.new("./test/fixtures")
    engine.startup
  end

  def test_initializes_an_item_repository
    repo = ItemRepository.new(nil, "./test/fixtures/items.csv")
    assert_equal "Item Qui Esse", repo.database[1].name
  end

  def test_it_returns_the_top_x_items_ranked_by_revenue_sold
    repo = engine.item_repository
    top_items = repo.most_revenue(2)

    assert_equal [16,5], top_items.map { |item| item.id }
  end

  def test_it_returns_the_top_x_items_ranked_by_number_sold
    repo = engine.item_repository
    top_items = repo.most_items(2)

    assert_equal [16,5], top_items.map { |item| item.id }

  end

end
