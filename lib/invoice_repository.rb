class InvoiceRepository < Repository
  attr_reader :successful_invoices

  # def initialize(engine, location)
  #   super
  #   @successful_invoices ||= successful_invoices
  # end

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

  def items_for_an_invoice(invoice_id)
    engine.items_for_an_invoice(invoice_id)
  end

  def successful_invoices
    database.select { |id, invoice| invoice.successful? }
  end

end
