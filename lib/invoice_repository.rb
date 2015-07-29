class InvoiceRepository < Repository
  def my_type repository, attributes
    Invoice.new repository, attributes
  end
end
