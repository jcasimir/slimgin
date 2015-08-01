require_relative 'transaction'

class TransactionRepository < Repository

  def my_type(repository, attributes)
    Transaction.new(repository, attributes)
  end

  def invoice_for_transaction(invoice_id)
    engine.invoice_for_transaction(invoice_id)
  end

end
