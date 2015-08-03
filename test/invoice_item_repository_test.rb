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
end
