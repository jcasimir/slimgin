require_relative 'test_helper'
require_relative '../lib/invoice_item'

class InvoiceItemTest < Minitest::Test
  def test_it_initializes_an_invoice_item
    i_item = InvoiceItem.new(nil, {item_id: "1"})

    assert_equal "1", i_item.item_id
  end

end
