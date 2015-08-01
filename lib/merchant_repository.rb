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

  def revenue_for_a_merchant(merchant_id)
    engine.revenue_for_a_merchant(merchant_id)
  end

  def most_revenue(top_x)
    all.map { |merchant_id, merchant| [merchant, merchant.revenue] }
        .sort_by { |merchant_and_revenue| merchant_and_revenue[1] }
        .reverse.first(top_x)
        .map { |merchant_and_revenue| merchant_and_revenue[0] }
  end

end
