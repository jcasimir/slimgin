require_relative "./test_helper"
require_relative "../lib/transaction_repository"

class TransactionRepositoryTest < Minitest::Test
  def test_it_exists
    assert TransactionRepository
  end

  def test_loads_the_data
    repo = TransactionRepository.new(nil, "./test/fixtures/transactions.csv")
    result = repo.database[1].invoice_id

    assert_equal 1, result
  end

end
