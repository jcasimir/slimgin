class Invoice
  attr_reader :id,
              :customer_id,
              :merchant_id,
              :status,
              :created_at,
              :updated_at,
              :repository

  def initialize(attributes, repository)
    @id           = attributes[:id]
    @customer_id  = attributes[:customer_id]
    @merchant_id  = attributes[:merchant_id]
    @status       = attributes[:status]
    @created_at   = attributes[:created_at]
    @updated_at   = attributes[:updated_at]
    @repository   = repository
  end

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
