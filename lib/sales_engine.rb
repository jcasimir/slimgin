class SalesEngine
  attr_accessor :locations, :merchant_repository, :invoice_repository, :item_repository, :invoice_item_repository, :customer_repository, :transaction_repository
  def startup
    @locations = {
      customer_repository: "./test/fixtures/customers.csv",
      invoice_repository: "./test/fixtures/invoices.csv",
      merchant_repository: "./test/fixtures/merchants.csv",
    }
    @customer_repository = CustomerRepository.new self, locations[:customer_repository]
    @invoice_repository = InvoiceRepository.new self, locations[:customer_repository]
    @merchant_repository = MerchantRepository.new self, locations[:merchant_repository]
  end
end
