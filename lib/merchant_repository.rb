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

  def revenue_for_a_merchant(merchant_id, date)
    engine.revenue_for_a_merchant(merchant_id, date)
  end

  def most_revenue(top_x)
    all.map { |merchant_id, merchant| [merchant, merchant.revenue] }
        .sort_by { |merchant_and_revenue| merchant_and_revenue[1] }
        .reverse.first(top_x)
        .map { |merchant_and_revenue| merchant_and_revenue[0] }
  end

  def most_items(top_x)
    all.map { |merchant_id, merchant| [merchant, merchant.total_items] }
        .sort_by { |merchant_and_items| merchant_and_items[1] }
        .reverse.first(top_x)
        .map { |merchant_and_items| merchant_and_items[0] }
  end

  def total_items_for_a_merchant(merchant_id)
    engine.total_items_for_a_merchant(merchant_id)
  end

  def revenue(date)
    engine.revenue_for_a_date(date)
  end

  def favorite_customer_for_a_merchant(merchant_id)
    customer_transactions = engine.transactions_per_customer_id(merchant_id)
    customer_id = customer_transactions.to_a.sort_by { |data| data[1] }.last[0]
    engine.customer_repository.find_by(id: customer_id)
  end

  def customers_with_pending_invoices_for_a_merchant(merchant_id)
    engine.customers_with_pending_invoices_for_a_merchant(merchant_id)
  end

end
