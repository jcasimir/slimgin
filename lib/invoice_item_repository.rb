require_relative "./repository"

class InvoiceItemRepository < Repository
  def my_type(repository, attributes)
    InvoiceItem.new(repository, attributes)
  end

  def invoice_for_invoice_item(invoice_id)
    engine.invoice_for_invoice_item(invoice_id)
  end

end
