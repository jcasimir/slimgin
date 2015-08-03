require_relative "./test_helper"
require_relative "../lib/transaction"
require_relative "../lib/sales_engine"

class TransactionTest < Minitest::Test
  attr_reader :engine

  def setup
    @engine = SalesEngine.new("./test/fixtures")
    engine.startup
  end

  def test_it_initializes_a_transaction
    transaction = Transaction.new(nil, {invoice_id: 1})

    assert_equal 1, transaction.invoice_id
  end

  def test_items_finds_associated_invoice_for_a_transaction
    repo = engine.transaction_repository
    transaction = repo.id(1)

    invoice = transaction.invoice

    assert_equal 1, invoice.id
  end
end
