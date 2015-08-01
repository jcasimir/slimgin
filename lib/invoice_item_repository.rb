require_relative "./repository"

class InvoiceItemRepository < Repository
  def my_type(repository, attributes)
    InvoiceItem.new(repository, attributes)
  end

end
