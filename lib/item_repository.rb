require_relative "./repository"

class ItemRepository < Repository
  def my_type(repository, attributes)
    Item.new(repository, attributes)
  end
end
