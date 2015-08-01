class MerchantRepository < Repository
  def my_type repository, attributes
    Merchant.new repository, attributes
  end

  def invoices_for_a_merchant(merchant_id)
    engine.invoices_for_a_merchant(merchant_id)
  end

  def items_for_a_merchant(merchant_id)
    engine.items_for_a_merchant(merchant_id)
  end

end
