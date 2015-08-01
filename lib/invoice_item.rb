require_relative "data_instance"

class InvoiceItem < DataInstance
  attr_reader :item_id, :invoice_id, :quantity, :unit_price

end
