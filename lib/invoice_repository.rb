require_relative 'invoice'
require_relative 'repository'

class InvoiceRepository < Repository
  attr_reader :successful_invoices

  def initialize(engine, location)
    super
    @successful_invoices ||= successful_invoices
  end

  def my_type repository, attributes
    Invoice.new repository, attributes
  end

  def find_by_id(id)
    id(id)
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

  def successful_invoices
    database.select { |id, invoice| invoice.successful? }
  end

  def select_for_a_merchant(merchant_id, current_invoices = successful_invoices)
    current_invoices.select { |id, invoice| invoice.merchant_id == merchant_id }
  end

  def select_for_a_date(date, current_invoices = successful_invoices)
    return current_invoices if date == ''
    current_invoices.select { |id, invoice| invoice.created_at.to_s.include?(date.to_s) }
  end

  def pending_invoices
    database.select { |id, invoice| !invoice.successful? }
  end

  def create(args)

    new_args = {id: (all.keys.last + 1), customer_id: args[:customer].id,
                  merchant_id: args[:merchant].id, status: args[:status],
                  created_at: Time.now, updated_at: Time.now}

    current_invoice = my_type(self, new_args)
    items = args[:items]
    items_and_quantities = Hash.new(0)
    items.each do |item|
      items_and_quantities[item] += 1
    end

    items_and_quantities.each do |item, quantity|
      invoice_item_args = {item: item, quantity: quantity, invoice_id: (all.keys.last + 1)}
      engine.create_invoice_item(invoice_item_args)
    end
    all[self.all.keys.last + 1] = current_invoice
    current_invoice
  end

  def create_transaction(args)
    engine.create_transaction(args)
  end



end
