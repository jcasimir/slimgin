require_relative "data_instance"

class InvoiceItem < DataInstance
  attr_reader :item_id, :invoice_id, :quantity, :unit_price

  def invoice
    repository.invoice_for_invoice_item(invoice_id)
  end

  def item
    repository.item_for_invoice_item(item_id)
  end

end
