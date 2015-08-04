require_relative 'data_instance'

class Customer < DataInstance
  attr_reader :first_name, :last_name

  def invoices
    repository.invoices_for_customer(id)
  end

  def transactions
    invoices.flat_map { |invoice| invoice.transactions }
  end
end
