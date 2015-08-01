require_relative "./test_helper"
require_relative "../lib/transaction"

class TransactionTest < Minitest::Test

  def test_it_initializes_a_transaction
    transaction = Transaction.new(nil, {invoice_id: "1"})

    assert_equal "1", transaction.invoice_id
  end
end
