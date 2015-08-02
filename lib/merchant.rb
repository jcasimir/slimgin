class Merchant < DataInstance
  attr_accessor :name

  def invoices
    repository.invoices_for_a_merchant(id)
  end

  def items
    repository.items_for_a_merchant(id)
  end

  def revenue(date = '')
    revenue = repository.revenue_for_a_merchant(id, date)
    revenue ||= 0
  end

  def total_items
    items = repository.total_items_for_a_merchant(id)
    items ||= 0
  end

  def favorite_customer
    repository.favorite_customer_for_a_merchant(id)
  end

  def customers_with_pending_invoices
    repository.customers_with_pending_invoices_for_a_merchant(id).uniq
  end

end
