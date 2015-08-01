class InvoiceRepository < Repository
  def my_type repository, attributes
    Invoice.new repository, attributes
  end

  def merchant_for_an_invoice(merchant_id)
    engine.merchant_for_an_invoice(merchant_id)
  end

  def transactions_for_an_invoice(invoice_id)
    engine.transactions_for_an_invoice(invoice_id)
  end

  def invoice_items_for_an_invoice(invoice_id)
    engine.invoice_items_for_an_invoice(invoice_id)
  end

end
