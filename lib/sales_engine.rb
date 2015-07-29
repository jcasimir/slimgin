class SalesEngine
  attr_accessor :merchant_repository, :invoice_repository, :item_repository, :invoice_item_repository, :customer_repository, :transaction_repository
  def startup
    locations = {
      customer_repository: "./fixtures/customers_head.csv",
      invoice_repository: "./fixutres/invoices_head.csv",
    }
    @customer_repository = CustomerRepository.new locations[:customer_repository]
    @invoice_repository = InvoiceRepository.new locations[:customer_repository]
  end
end
