require_relative "./repository"
require_relative 'item'
class ItemRepository < Repository
  def my_type(repository, attributes)
    Item.new(repository, attributes)
  end

  def find_by_id(id)
    id(id)
  end

  def find_by_name(name)
    find_by(name: name)
  end

  def find_all_by_name(name)
    find_all_by(name: name)
  end

  def find_by_description(description)
    find_by(description: description)
  end

  def find_all_by_description(description)
    find_all_by(description: description)
  end

  def find_by_unit_price(unit_price)
    find_by(unit_price: unit_price)
  end

  def find_all_by_unit_price(unit_price)
    find_all_by(unit_price: unit_price)
  end

  def find_by_merchant_id(merchant_id)
    find_by(merchant_id: merchant_id)
  end

  def find_all_by_merchant_id(merchant_id)
    find_all_by(merchant_id: merchant_id)
  end


  def invoice_items_for_an_item(item_id)
    engine.invoice_items_for_an_item(item_id)
  end

  def merchant_for_an_item(merchant_id)
    engine.merchant_for_an_item(merchant_id)
  end

end
