require_relative "data_instance"
require "bigdecimal"

class InvoiceItem < DataInstance
  attr_reader :item_id, :invoice_id, :quantity, :unit_price

  def initialize(repository, attributes)
    super
    @unit_price = BigDecimal.new(unit_price) / 100
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
