require_relative 'transaction'

class TransactionRepository < Repository

  def my_type(repository, attributes)
    Transaction.new(repository, attributes)
  end
  
end
