require_relative "test_helper"
require_relative "../lib/sales_engine"
require_relative "../lib/invoice_item"

class InvoiceItemRepositoryTest < Minitest::Test
  attr_reader :engine

  def setup
    @engine = SalesEngine.new("./test/fixtures")
    engine.startup
  end

  def test_it_initializes_a_repository

    repo = engine.invoice_item_repository
    invoice_item = repo.database[1]
    assert_equal 5, invoice_item.quantity
  end

  def test_create_invoice_item_works

    s_engine = SalesEngine.new("./test/fixtures")
    s_engine.startup
    repo = s_engine.invoice_item_repository
    item = s_engine.item_repository.find_by_id(99)
    quantity = 1
    current_invoice_id = 3

    repo.create_invoice_item({item: item, quantity: quantity, invoice_id: current_invoice_id})

    assert_equal 99, repo.all[repo.all.keys.last].item_id
  end
end
