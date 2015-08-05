require_relative 'data_instance'

class Customer < DataInstance
  attr_reader :first_name, :last_name

  def invoices
    repository.invoices_for_customer(id)
  end

  def transactions
    invoices.flat_map { |invoice| invoice.transactions }
  end

  def favorite_merchant
      successful = transactions.select { |transaction| transaction.result == "success"}

      grouped = successful.group_by { |transaction| transaction.invoice.merchant_id }
      
      merchant_transactions = Hash.new(0)

      grouped.each do |merch_id, transactions|
        merchant_transactions[merch_id] = transactions.count
      end
      highest_transactions = merchant_transactions.values.sort.last
      highest_id = merchant_transactions.key(highest_transactions)
      repository.engine.merchant_repository.find_by_id(highest_id)
  end

end
