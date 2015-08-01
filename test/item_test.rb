require_relative 'test_helper'
require_relative '../lib/item'

class ItemTest < Minitest::Test

  def test_it_initializes_an_item
    item = Item.new(nil, name: "cake")
    assert_equal "cake", item.name
  end
end
