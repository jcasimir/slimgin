require_relative 'invoice'
require_relative 'repository'

class InvoiceRepository < Repository
  attr_reader :all_successful_invoices

  def initialize(engine, location)
    super
    @all_successful_invoices ||= all_successful_invoices
  end

  def my_type repository, attributes
    Invoice.new repository, attributes
  end

  def find_by_id(id)
    find_by(id: id)
  end

  def find_by_customer_id(customer_id)
    find_by(customer_id: customer_id)
  end

  def find_all_by_customer_id(customer_id)
    find_all_by(customer_id: customer_id)
  end

  def find_by_merchant_id(merchant_id)
    find_by(merchant_id: merchant_id)
  end

  def find_all_by_merchant_id(merchant_id)
    find_all_by(merchant_id: merchant_id)
  end

  def find_by_status(status)
    find_by(status: status)
  end

  def find_all_by_status(status)
    find_all_by(status: status)
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
    current_invoices.select { |id, invoice| invoice.created_at.to_s.include?(date.to_s) }
  end

  def pending_invoices
    database.select { |id, invoice| !invoice.successful? }
  end

end
