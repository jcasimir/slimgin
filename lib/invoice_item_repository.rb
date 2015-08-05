require_relative "repository"
require_relative 'invoice_item'

class InvoiceItemRepository < Repository
  attr_reader :successful_invoice_items

  def initialize(engine, location)
    super
    @successful_invoice_items ||= create_successful_invoice_items
  end

  def my_type(repository, attributes)
    InvoiceItem.new(repository, attributes)
  end

  def create_successful_invoice_items
    successful_invoices = engine.invoice_repository.successful_invoices
    all.select do |id, inv_item|
      successful_invoices.keys.include?(inv_item.invoice_id)
    end
  end

  def find_by_id(id)
    id(id)
  end

  def find_by_item_id(item_id)
    find_by(item_id: item_id)
  end

  def find_all_by_item_id(item_id)
    find_all_by(item_id: item_id)
  end

  def find_by_invoice_id(invoice_id)
    find_by(invoice_id: invoice_id)
  end

  def find_all_by_invoice_id(invoice_id)
    find_all_by(invoice_id: invoice_id)
  end

  def find_by_quantity(quantity)
    find_by(quantity: quantity)
  end

  def find_all_by_quantity(quantity)
    find_all_by(quantity: quantity)
  end

  def find_by_unit_price(unit_price)
    find_by(unit_price: unit_price)
  end

  def find_all_by_unit_price(unit_price)
    find_all_by(unit_price: unit_price)
  end


  def invoice_for_invoice_item(invoice_id)
    engine.invoice_for_invoice_item(invoice_id)
  end

  def item_for_invoice_item(item_id)
    engine.item_for_invoice_item(item_id)
  end

  def item_ids_and_total_prices
    totals = Hash.new(0)
    all.each do |id, inv_item|
      totals[inv_item.item_id] += inv_item.total_price
    end
    totals
  end

  def item_ids_and_quantities
    totals = Hash.new(0)
    successful_invoice_items.each do |id, inv_item|
      totals[inv_item.item_id] += inv_item.quantity
    end
    totals
  end



  def create_invoice_item(args)

    formatted_args = { item_id: args[:item].id,
                      invoice_id: args[:invoice_id], quantity: args[:quantity],
                      unit_price: args[:item].unit_price, created_at: Time.now,
                      updated_at: Time.now}


    new_invoice_item = InvoiceItem.new(self, formatted_args)

    all[self.all.keys.last + 1] = new_invoice_item

  end

end
