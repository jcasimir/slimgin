require "bigdecimal"

class InvoiceItem
  attr_reader :id,
              :item_id,
              :invoice_id,
              :quantity,
              :unit_price,
              :created_at,
              :updated_at,
              :repository

  def initialize(attributes, repository)
    @id          = attributes[:id]
    @item_id     = attributes[:item_id]
    @invoice_id  = attributes[:invoice_id]
    @quantity    = attributes[:quantity]
    @unit_price  = BigDecimal.new(attributes[:unit_price]) / 100
    @created_at  = attributes[:created_at]
    @updated_at  = attributes[:updated_at]
    @repository  = repository
  end

  def invoice
    repository.invoice_for_invoice_item(invoice_id)
  end

  def item
    repository.item_for_invoice_item(item_id)
  end

  def total_price
    quantity.to_i * unit_price
  end

end
