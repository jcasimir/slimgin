class Item
  attr_reader :id,
              :name,
              :description,
              :unit_price,
              :merchant_id,
              :created_at,
              :updated_at,
              :repository

  def initialize(attributes, repository)
    @id          = attributes[:id]
    @name        = attributes[:name]
    @description = attributes[:description]
    @unit_price  = BigDecimal.new(attributes[:unit_price]) / 100
    @merchant_id = attributes[:merchant_id]
    @created_at  = attributes[:created_at]
    @updated_at  = attributes[:updated_at]
    @repository  = repository
  end

  def invoice_items
    repository.invoice_items_for_an_item(id)
  end

  def merchant
    repository.merchant_for_an_item(merchant_id)
  end

  def best_day
    s_invoice_items = repository.successful_invoice_items
    relevant_i_items = s_invoice_items.select do |inv_item_id, invoice_item|
      invoice_item.item_id == id
    end
      date = date_and_revenue(relevant_i_items).to_a
      last_date = date.sort_by { |group| group[1] }.last[0]
      Date.parse(last_date.to_s)
  end

  def date_and_revenue(invoice_items)
    date_and_revenue = Hash.new(0)
    invoice_items.each do |id, invoice_item|
      invoice = invoice_item.invoice
      date_and_revenue[invoice.created_at] += invoice_item.total_price
    end
    date_and_revenue
  end

end
