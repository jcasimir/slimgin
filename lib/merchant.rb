class Merchant < DataInstance
  attr_accessor :name

  def invoices
    repository.invoices_for_a_merchant(id)
  end

end
