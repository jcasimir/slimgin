require_relative 'data_instance'

class Invoice < DataInstance
  attr_reader :customer_id, :merchant_id, :status

  def customer
    customer_repository.id(customer_id)
  end

  def merchant
    repository.merchant_for_an_invoice(merchant_id)
  end

  def transactions
    repository.transactions_for_an_invoice(id)
  end

  def invoice_items
    repository.invoice_items_for_an_invoice(id)
  end

  def items
    repository.items_for_an_invoice(id)
  end

  def successful?
    transactions.any? { |transaction| transaction.result == "success" }
  end

  def charge(args)
    new_args = {invoice_id: id}
    args = args.merge(new_args)

    repository.create_transaction(args)

  end





end
