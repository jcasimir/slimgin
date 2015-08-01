class InvoiceRepository < Repository
  attr_reader :all_successful_invoices

  def initialize(engine, location)
    super
    @all_successful_invoices ||= all_successful_invoices
  end

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

  def all_successful_invoices
    database.select { |id, invoice| invoice.successful? }
  end

  def select_for_a_merchant(merchant_id, current_invoices = all_successful_invoices)
    current_invoices.select { |id, invoice| invoice.merchant_id == merchant_id }
  end

  def select_for_a_date(date, current_invoices = all_successful_invoices)
    current_invoices.select { |id, invoice| invoice.created_at.include?(date) }
  end

end
