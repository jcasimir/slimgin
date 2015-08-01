require_relative "./repository"

class ItemRepository < Repository
  def my_type(repository, attributes)
    Item.new(repository, attributes)
  end

  def invoice_items_for_an_item(item_id)
    engine.invoice_items_for_an_item(item_id)
  end

  def merchant_for_an_item(merchant_id)
    engine.merchant_for_an_item(merchant_id)
  end
  
end
