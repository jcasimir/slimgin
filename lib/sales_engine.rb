class SalesEngine
  attr_accessor :locations, :merchant_repository, :invoice_repository, :item_repository, :invoice_item_repository, :customer_repository, :transaction_repository
  def startup
    @locations = {
      customer_repository: "./test/fixtures/customers.csv",
      invoice_repository: "./test/fixtures/invoices.csv",
      merchant_repository: "./test/fixtures/merchants.csv",
      item_repository: "./test/fixtures/items.csv",
    }
    @customer_repository = CustomerRepository.new self, locations[:customer_repository]
    @invoice_repository = InvoiceRepository.new self, locations[:invoice_repository]
    @merchant_repository = MerchantRepository.new self, locations[:merchant_repository]
    @item_repository = ItemRepository.new self, locations[:item_repository]
  end

  def invoices_for_a_merchant(merchant_id)
    invoice_repository.find_all_by(merchant_id: merchant_id)
  end

end
