require_relative "repository"
require_relative 'invoice_item'

class InvoiceItemRepository < Repository
  def my_type(repository, attributes)
    InvoiceItem.new(repository, attributes)
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

end
