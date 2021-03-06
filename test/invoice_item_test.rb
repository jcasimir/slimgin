require_relative 'test_helper'
require_relative '../lib/invoice_item'
require_relative '../lib/sales_engine'

class InvoiceItemTest < Minitest::Test
  attr_reader :engine

  def setup
    @engine = SalesEngine.new("./test/fixtures")
    engine.startup
  end

  def test_it_initializes_an_invoice_item
    i_item = InvoiceItem.new(nil, {item_id: 1, unit_price: 123})

    assert_equal 1, i_item.item_id
  end

  def test_it_can_find_its_invoice
    repo = engine.invoice_item_repository
    i_item = InvoiceItem.new(repo, {invoice_id: 1, unit_price: 123})

    invoice = i_item.invoice
    assert_equal 1, invoice.id
  end

  def test_it_can_find_its_item
    repo = engine.invoice_item_repository
    i_item = InvoiceItem.new(repo, {item_id: 539, unit_price: 123})

    item = i_item.item

    assert_equal 539, item.id
  end

  def test_it_can_total_price
    repo = engine.invoice_item_repository
    invoice_item = repo.id(1)

    result = invoice_item.total_price
    assert_equal 681.75, result
  end

end
