class Customer
  attr_reader :id,
              :first_name,
              :last_name
              :created_at,
              :updated_at,
              :repository

  def initialize(attributes, repository)
    @id          = attributes[:id]
    @first_name  = attributes[:first_name]
    @last_name   = attributes[:last_name]
    @created_at  = attributes[:created_at]
    @updated_at  = attributes[:updated_at]
    @repository  = repository
  end

  def invoices
    repository.invoices_for_customer(id)
  end

  def transactions
    invoices.flat_map { |invoice| invoice.transactions }
  end

  def successful_transactions
    transactions.select { |transaction| transaction.result == "success"}
  end

  def merchant_id_and_transactions
    successful_transactions.group_by do |transaction|
      transaction.invoice.merchant_id
    end
  end

  def counts_transactions
    merchant_transactions = Hash.new(0)
    merchant_id_and_transactions.each do |merch_id, transactions|
      merchant_transactions[merch_id] = transactions.count
    end
    merchant_transactions
  end

  def favorite_merchant
    highest_transactions = counts_transactions.values.sort.last
    highest_id = counts_transactions.key(highest_transactions)
    repository.engine.merchant_repository.find_by_id(highest_id)
  end

end
