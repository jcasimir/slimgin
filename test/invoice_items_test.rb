require_relative 'test_helper'
require_relative '../lib/invoice_item'

class InvoiceItemTest < Minitest::Test
  attr_reader :engine

  def setup
    @engine = SalesEngine.new
    engine.startup
  end

  def test_it_initializes_an_invoice_item
    i_item = InvoiceItem.new(nil, {item_id: "1"})

    assert_equal "1", i_item.item_id
  end

  def test_it_can_find_its_invoice
    repo = engine.invoice_item_repository
    i_item = InvoiceItem.new(repo, {invoice_id: "1"})

    invoice = i_item.invoice
    assert_equal "1", invoice.id
  end

end
