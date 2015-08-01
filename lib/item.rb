require_relative 'data_instance'

class Item < DataInstance
  attr_reader :name, :description, :unit_price, :merchant_id

end
