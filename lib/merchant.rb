class Merchant < DataInstance
  attr_accessor :name

  def invoices
    repository.invoices_for_a_merchant(id)
  end

  def items
    repository.items_for_a_merchant(id)
  end

  def revenue
    revenue = repository.revenue_for_a_merchant(id)
    revenue ||= 0
  end

end
